FROM node:alpine
MAINTAINER Somasekhar
RUN npm i
COPY . .
CMD ["npm","start"]