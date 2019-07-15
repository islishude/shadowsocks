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

### Usage

```console
$ export ALL_PROXY=sock5://127.0.0.1:1080
$ curl https://google.com
<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>301 Moved</TITLE></HEAD><BODY>
<H1>301 Moved</H1>
The document has moved
<A HREF="https://www.google.com/">here</A>.
</BODY></HTML>
```
