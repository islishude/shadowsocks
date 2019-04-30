# Shadowsocks Dockerfile

## Server

```
docker run -d -p 8488:8488 \
islishude/shadowsocks \
 -s 'ss://AEAD_CHACHA20_POLY1305:your-password@:8488' -verbose
```

## Client

```
docker run -d -p 1080:1080 \
islishude/shadowsocks
 -c 'ss://AEAD_CHACHA20_POLY1305:your-password@[server_address]:8488' \
-verbose -socks :1080
```

learn more to see [this](https://github.com/shadowsocks/go-shadowsocks2/blob/master/README.md).
