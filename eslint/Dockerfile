FROM node:16.6.1-slim

ENV NODE_ENV production

WORKDIR /linter

RUN npm i -g npm-check-updates

COPY package.json .
RUN npm install

COPY .eslintrc.yml .
COPY linter .

# VOLUME /tmp

ENV NODE_PATH /linter/node_modules

CMD ./linter
