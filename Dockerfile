FROM node:16.5-alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --only=production
COPY ./src ./src
COPY ./media ./media
CMD npm start