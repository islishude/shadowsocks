FROM golang:1.13.5-alpine@sha256:ddf407284440a94889dc139bbe1be1daa19d99e166d6b1f2dfc6919846810b4e AS BUILDER
ENV GO111MODULE=on
RUN apk add --no-cache git ca-certificates
WORKDIR /workdir
RUN git clone --quiet --depth=1 https://github.com/shadowsocks/go-shadowsocks2 .
RUN go install

FROM alpine:3.11.0@sha256:d371657a4f661a854ff050898003f4cb6c7f36d968a943c1d5cde0952bd93c80
COPY --from=BUILDER /go/bin/go-shadowsocks2 /usr/local/bin/shadowsocks
USER nobody:nobody
ENTRYPOINT [ "/usr/local/bin/shadowsocks" ]
