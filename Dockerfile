FROM golang:1.13.5-alpine@sha256:eec8b6c0bc53eff8fc6d5f934279138854f6c93c7d997cb292bcab09d3c6a3b6 AS BUILDER
ENV GO111MODULE=on
RUN apk add --no-cache git ca-certificates
WORKDIR /workdir
RUN git clone --quiet --depth=1 https://github.com/shadowsocks/go-shadowsocks2 .
RUN go install

FROM alpine:3.11.2@sha256:3983cc12fb9dc20a009340149e382a18de6a8261b0ac0e8f5fcdf11f8dd5937e
COPY --from=BUILDER /go/bin/go-shadowsocks2 /usr/local/bin/shadowsocks
USER nobody:nobody
ENTRYPOINT [ "/usr/local/bin/shadowsocks" ]
