FROM golang:1.13.6-alpine3.11
EXPOSE 8080

RUN adduser go -h /go -s /bin/sh -D
RUN chown -fR go:go /go
RUN apk add --no-cache make gcc g++ python
RUN apk update && apk add --no-cache python make yarn git
RUN apk add --no-cache musl-dev 
RUN yarn global add node-gyp
RUN yarn global add dredd
RUN yarn global add hercule
USER go
RUN mkdir -p /go/src
RUN mkdir -p /go/bin
RUN mkdir -p /go/pkg
ENV GOPATH /go
ENV GOBIN /go/bin
WORKDIR /go
