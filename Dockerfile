FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
RUN echo "Hello"
RUN ls
RUN pwd
RUN rm -rf build
COPY ./ ./
RUN rm -rf build
RUN ls
RUN pwd
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
