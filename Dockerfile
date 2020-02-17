### STAGE 1: Build ###
FROM node:12.7-alpine AS build
WORKDIR /usr/src/app
COPY *.* ./
RUN npm install
COPY . .
RUN npm run build
#CMD [ "ng", "serve" ]

### STAGE 2: Run ###
#FROM nginx:1.17.1-alpine
FROM bitnami/nginx
COPY --from=build /usr/src/app/dist/* /usr/share/nginx/html
