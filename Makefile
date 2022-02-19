# I actually do most of my development on a windows box, so a cross-platform make file helps me out a lot.
# make will attempt to do things in the order given in the deps

up: traefik lldap authelia inadyn

down: inadyn-down authelia-down lldap-down traefik-down

restart: down up

traefik lldap authelia inadyn:
	$(MAKE) -C $@ up

inadyn-down authelia-down lldap-down traefik-down:
	$(MAKE) -C $(subst -down,,$@) down

.PHONY: up down restart traefik authelia lldap inadyn inadyn-down authelia-down lldap-down traefik-down