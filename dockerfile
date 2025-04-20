FROM node:18

WORKDIR /opt/
COPY package.json yarn.lock ./
RUN yarn install  
RUN yarn add react@^18.0.0 react-dom@^18.0.0 react-router-dom@^6.0.0 styled-components@^6.0.0
COPY . .
RUN yarn build

EXPOSE 1337
CMD ["yarn", "dev"]