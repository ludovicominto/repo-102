FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
RUN mkdir build
RUN ls /app/public
RUN ls /app/build
RUN cp /app/public/favicon.ico /app/build/favicon.ico
RUN ls /app/public
RUN ls /app/build
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
