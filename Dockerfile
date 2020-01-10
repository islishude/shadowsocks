FROM golang:1.13.6-alpine@sha256:25a6e3dfe35e1099ce674b1e4c2a1fbe1acf612f2989277e207489bb04c13a6f AS BUILDER
ENV GO111MODULE=on
RUN apk add --no-cache git ca-certificates
WORKDIR /workdir
RUN git clone --quiet --depth=1 https://github.com/shadowsocks/go-shadowsocks2 .
RUN go install

FROM alpine:3.11.2@sha256:3983cc12fb9dc20a009340149e382a18de6a8261b0ac0e8f5fcdf11f8dd5937e
COPY --from=BUILDER /go/bin/go-shadowsocks2 /usr/local/bin/shadowsocks
USER nobody:nobody
ENTRYPOINT [ "/usr/local/bin/shadowsocks" ]
