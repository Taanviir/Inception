DOCKER_COMPOSE_FILE := ./srcs/requirements/docker-compose.yml

all: up

up:
	docker compose -f $(DOCKER_COMPOSE_FILE) up --detach

.PHONY: all up