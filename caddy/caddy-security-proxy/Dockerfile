ARG CADDY_VERSION=2.4.0
FROM caddy:${CADDY_VERSION}-builder AS builder

LABEL org.opencontainers.image.vendor="Ashen Blue"

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/plugin \
    --with github.com/greenpau/caddy-security

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]