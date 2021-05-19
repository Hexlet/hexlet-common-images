FROM python:3.9-alpine

RUN apk add --no-cache bash

WORKDIR /linter

RUN pip install -U --target ./lib wemake-python-styleguide==0.14.1
RUN pip install -U crudini

COPY linter linter
COPY setup.cfg setup.cfg

CMD ./linter
