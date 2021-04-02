# stage1
FROM node:15.13.0-alpine3.10 as builder
WORKDIR /reactapp
COPY package.json /reactapp
RUN npm install
COPY . /reactapp
RUN npm run build

#stage2
FROM nginx:1.19.9-alpine
COPY --from=builder /reactapp/build /usr/share/nginx/html