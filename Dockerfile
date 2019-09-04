FROM golang:1.13.0-alpine3.10 AS BUILDER
RUN apk update && apk add --no-cache git ca-certificates
RUN go get -v -ldflags '-w -s' github.com/shadowsocks/go-shadowsocks2
RUN mkdir /user && \
    echo 'nobody:x:65534:65534:nobody:/:' > /user/passwd && \
    echo 'nobody:x:65534:' > /user/group

FROM alpine:3.10 as PRODUCTION
COPY --from=builder /user/group /user/passwd /etc/
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=BUILDER /go/bin/go-shadowsocks2 /usr/bin/shadowsocks
USER nobody:nobody
ENTRYPOINT [ "/usr/bin/shadowsocks" ]
