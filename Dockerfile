# Specify a base Image
FROM node:alpine as builder 

WORKDIR /app

#Install some dependencies
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

#Actual run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
