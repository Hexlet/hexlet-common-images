FROM node:22-slim

ENV NODE_ENV production

WORKDIR /linter

RUN npm i -g npm-check-updates

COPY package.json .
RUN npm install

COPY .eslintrc.yml .
COPY linter .
COPY tsconfig.json .
COPY babel.config.js .

CMD ./linter
