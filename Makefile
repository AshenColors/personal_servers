# I actually do most of my development on a windows box, so a cross-platform make file helps me out a lot.
# make will attempt to do things in the order given in the deps

up: caddy-docker-proxy nextcloud collabora boringproxy

down: boringproxy-down collabora-down nextcloud-down caddy-docker-proxy-down

restart: down up

caddy-docker-proxy whoami nextcloud collabora boringproxy:
	$(MAKE) -C $@ up

boringproxy-down collabora-down nextcloud-down whoami-down caddy-docker-proxy-down:
	$(MAKE) -C $(subst -down,,$@) down

.PHONY: up down restart caddy-docker-proxy whoami nextcloud boringproxy collabora collabora-down boringproxy-down nextcloud-down whoami-down caddy-docker-proxy-down