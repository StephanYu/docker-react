FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN yarn install
COPY . .
RUN yarn run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html


