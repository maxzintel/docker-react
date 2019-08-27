FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# /app/build output is this folder
# This is what we want to serve up to
# the outside world via the RUN phase.

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# Check nginx docs on docker hub.
