FROM node:14.17.3 as build
#FROM node:14.17.3  

WORKDIR /demoapp

COPY package-lock.json package-lock.json
COPY package.json package.json

# RUN npm install

RUN npm ci --production

COPY . .

#CMD ["npm", "run", "start"]

RUN npm run build

#nginx web server
FROM nginx:1.12-alpine 

COPY --from=build /demoapp/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx","-g", "daemon off;"]


