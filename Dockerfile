FROM node:alpine as build
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn run build

FROM nginx
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html


