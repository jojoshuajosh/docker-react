#build phase

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#run phase
#when initiate nginx using FROM NGINX it will automaticly start nginx service no need to start
#this phase will dump any useless package and take only import part

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html