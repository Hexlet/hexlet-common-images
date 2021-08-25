FROM python:3.8-alpine

WORKDIR /linter

# https://docs.sqlfluff.com/en/stable/
RUN pip install -U --target ./lib sqlfluff==0.6.4

COPY linter .
COPY setup.cfg .

CMD ./linter
