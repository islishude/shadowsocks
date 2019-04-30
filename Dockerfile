FROM golang:1.12.4-alpine3.9 AS BUILDER
RUN apk update && apk add --no-cache git
RUN go get -v -ldflags '-w -s' github.com/shadowsocks/go-shadowsocks2

FROM alpine:3.9 as PRODUCTION
COPY --from=BUILDER /go/bin/go-shadowsocks2 /usr/bin/shadowsocks
ENTRYPOINT [ "/usr/bin/shadowsocks" ]
