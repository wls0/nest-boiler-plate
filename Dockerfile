FROM node:alpine

WORKDIR /app
COPY . .

RUN yarn install 
RUN yarn build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD ["yarn", "start"]
