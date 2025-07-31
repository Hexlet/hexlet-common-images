FROM golang:alpine

RUN apk add --no-cache bash

WORKDIR /linter
ENV GOPATH=/linter
ENV PATH=$PATH:$GOPATH/bin

RUN go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@v2.3.0
ENV PATH=/exercises-go/bin:/root/go/bin:$PATH

ENV GOFLAGS=-buildvcs=false
ENV GOLANGCI_LINT_CACHE=/var/tmp/.cache
ENV GOCACHE=/var/tmp/.cache
ENV GOTMPDIR=/var/tmp/.cache

COPY linter .
COPY .golangci.yml .

CMD ["./linter"]
