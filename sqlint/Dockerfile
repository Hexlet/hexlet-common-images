FROM python:3.10-slim

WORKDIR /linter

# https://docs.sqlfluff.com/en/stable/
RUN pip install -U --target ./lib sqlfluff==2.0.3

COPY linter .

CMD ./linter
