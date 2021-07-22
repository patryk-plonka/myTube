FROM node:16.5-alpine
ARG DEFAULT_PORT=3000
ENV PORT $DEFAULT_PORT
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --only=production
COPY ./src ./src
COPY ./media ./media
CMD npm start