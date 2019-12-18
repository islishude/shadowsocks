FROM golang:1.13.5-alpine@sha256:ddf407284440a94889dc139bbe1be1daa19d99e166d6b1f2dfc6919846810b4e AS BUILDER
ENV GO111MODULE=on
RUN apk add --no-cache git ca-certificates
WORKDIR /workdir
RUN git clone --quiet --depth=1 https://github.com/shadowsocks/go-shadowsocks2 .
RUN go install

FROM alpine:3.10.3@sha256:e4355b66995c96b4b468159fc5c7e3540fcef961189ca13fee877798649f531a
COPY --from=BUILDER /go/bin/go-shadowsocks2 /usr/local/bin/shadowsocks
USER nobody:nobody
ENTRYPOINT [ "/usr/local/bin/shadowsocks" ]
