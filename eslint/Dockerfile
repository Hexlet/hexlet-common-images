FROM node:23-slim


WORKDIR /linter


COPY package.json .
RUN npm install

COPY eslint.config.js .
COPY linter .

CMD ./linter
