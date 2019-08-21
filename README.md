# Shadowsocks Dockerfile

## Server

```
docker run -d -p 8488:8488 \
islishude/shadowsocks \
 -s 'ss://AEAD_CHACHA20_POLY1305:your-password@:8488' -verbose
```

## Client

```
docker run -d -p 1080:1080 islishude/shadowsocks \
-c 'ss://AEAD_CHACHA20_POLY1305:your-password@[server_address]:8488' -verbose -socks :1080
```

learn more to see [this](https://github.com/shadowsocks/go-shadowsocks2/blob/master/README.md).

## Usage

go-shadowsocks doesn't support http proxy at now,use sock5 proxy please

```console
$ export ALL_PROXY=sock5://127.0.0.1:1080
$ curl -I https://google.com
HTTP/1.1 200 Connection established

HTTP/2 301
location: https://www.google.com/
content-type: text/html; charset=UTF-8
date: Thu, 28 Feb 2019 03:37:48 GMT
expires: Sat, 30 Mar 2019 03:37:48 GMT
cache-control: public, max-age=2592000
server: gws
content-length: 220
x-xss-protection: 1; mode=block
x-frame-options: SAMEORIGIN
alt-svc: quic=":443"; ma=2592000; v="44,43,39"
```
