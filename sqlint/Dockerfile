FROM python:3.12-slim

WORKDIR /linter

# https://docs.sqlfluff.com/en/stable/
RUN pip install -U --target ./lib sqlfluff==3.4.0

COPY linter .

CMD ["./linter"]
