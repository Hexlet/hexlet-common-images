FROM python:3.8-alpine

WORKDIR /linter

# https://docs.sqlfluff.com/en/stable/
RUN pip install -U --target ./lib sqlfluff==0.7.1

COPY linter .

CMD ./linter
