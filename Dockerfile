FROM node:alpine AS build-stage 
WORKDIR /app
# COPY package.json .
# RUN npm install 
# COPY . .

COPY . .
RUN npm install 

RUN npx parcel build "src/index.html" --dist-dir "dist" --public-url "./"

FROM nginx:latest
COPY --from=build-stage /app/dist /usr/share/nginx/html