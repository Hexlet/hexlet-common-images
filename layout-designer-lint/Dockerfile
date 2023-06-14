FROM node:16.13.0-slim

ENV NODE_ENV production

WORKDIR /linter

RUN npm i -g npm-check-updates

COPY package.json .
COPY .stylelintrc .
COPY .htmlhintrc .
COPY .pug-lintrc .

RUN npm install

COPY linter .

CMD ./linter
