down:
	docker stack rm authelia

up: down
	docker stack deploy -c ./docker-compose.yaml authelia

.PHONY: up down 