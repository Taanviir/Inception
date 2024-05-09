DOCKER_COMPOSE := docker compose
DOCKER_COMPOSE_FILE := -f ./srcs/docker-compose.yml

all: up

# setting up docker containers by building images first then running in detached mode
up:
	$(DOCKER_COMPOSE) $(DOCKER_COMPOSE_FILE) up --build --detach

# stopping and removing all docker containers, network, images and volumes
down:
	$(DOCKER_COMPOSE) $(DOCKER_COMPOSE_FILE) down --rmi all --volumes

# building docker images
build:
	$(DOCKER_COMPOSE) $(DOCKER_COMPOSE_FILE) build

# dry run to check if docker compose works
dry-run:
	$(DOCKER_COMPOSE) $(DOCKER_COMPOSE_FILE) --dry-run up --build -d

info:
	@echo "Container Info:"
	@docker ps -a
	@echo
	@echo "Images Info:"
	@docker images
	@echo
	@echo "Network Info:"
	@docker network ls

.PHONY: all up down build dry-run info
