FROM golang:alpine

RUN apk add --no-cache bash

WORKDIR /linter
ENV GOPATH=/linter
ENV PATH=$PATH:$GOPATH/bin

RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.52.2

ENV GOFLAGS=-buildvcs=false
ENV GOLANGCI_LINT_CACHE=/var/tmp/.cache
ENV GOCACHE=/var/tmp/.cache
ENV GOTMPDIR=/var/tmp/.cache

COPY linter .
COPY .golangci.yml .

CMD ./linter
