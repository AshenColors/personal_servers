down:
	docker stack rm lldap

up: down
	docker stack deploy -c ./docker-compose.yaml lldap

.PHONY: up down 