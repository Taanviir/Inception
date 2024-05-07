DOCKER_COMPOSE_FILE := ./srcs/docker-compose.yml

all: up

# setting up docker containers in detached mode
up:
	docker compose -f $(DOCKER_COMPOSE_FILE) up --detach

# removing all docker containers, network, images and volumes
down:
	docker compose -f $(DOCKER_COMPOSE_FILE) down --rmi all -v

.PHONY: all up down
