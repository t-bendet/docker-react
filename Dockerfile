FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
FROM nginx
# instruction for elastic bean stalk which port to use for incoming traffic
EXPOSE 80 
# copy from the first phase 
COPY --from=0 /app/build /usr/share/nginx/html