# I actually do most of my development on a windows box, so a cross-platform make file helps me out a lot.
# make will attempt to do things in the order given in the deps

up: traefik lldap authelia syncthing inadyn

down: inadyn-down authelia-down lldap-down syncthing-down traefik-down

restart: down up

traefik lldap authelia inadyn:
	$(MAKE) -C $@ up

inadyn-down authelia-down lldap-down traefik-down:
	$(MAKE) -C $(subst -down,,$@) down

.PHONY: up down restart traefik authelia lldap inadyn syncthing inadyn-down authelia-down lldap-down traefik-down syncthing-down