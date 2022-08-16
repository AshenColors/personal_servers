up:
	docker compose --verbose up -d

down:
	docker compose --verbose down

restart: down up

.PHONY: up down restart