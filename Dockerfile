FROM golang:1.13.4-alpine3.10@sha256:4a4c714a78dba7130163e670d1c9fed1cfbf3f9b38ee4f10f6e07cdf31bdc9d5 AS BUILDER
ENV GO111MODULE=on
RUN apk add --no-cache git ca-certificates
WORKDIR app
RUN git clone https://github.com/shadowsocks/go-shadowsocks2
RUN cd go-shadowsocks2 && go install

FROM alpine:3.10.3@sha256:77cbe97593c890eb1c4cadcbca37809ebff2b5f46a036666866c99f08a708967
COPY --from=BUILDER /go/bin/go-shadowsocks2 /usr/bin/shadowsocks
USER nobody:nobody
ENTRYPOINT [ "/usr/bin/shadowsocks" ]
