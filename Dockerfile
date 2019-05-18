FROM apiaryio/dredd
EXPOSE 8080

RUN adduser go -h /go -s /bin/sh -D
RUN chown -fR go:go /go
RUN apk update && apk add go musl-dev git bash make gcc
USER go
ENV GOPATH /go
ENV GOBIN /go/bin
WORKDIR /go
