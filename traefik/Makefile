down:
	-docker stack rm traefik

up: down
	docker stack deploy -c ./make-network.yaml traefik
	docker stack deploy -c ./docker-compose.yaml traefik

.PHONY: up down 