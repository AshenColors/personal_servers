up:
	docker stack deploy -c ./docker-compose.yaml $(notdir $(CURDIR))

down:
	docker stack rm $(notdir $(CURDIR))

restart: down up

.PHONY: up down restart