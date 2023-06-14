FROM python:3.9-alpine

RUN apk add --no-cache bash

WORKDIR /linter

RUN pip install -U --target ./lib flake8

COPY linter linter
COPY setup.cfg setup.cfg

CMD ./linter
