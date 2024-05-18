DOCKER_COMPOSE := docker compose -f ./srcs/docker-compose.yml

all: up

# setting up docker containers by building images first then running in detached mode
up:
	@if [ ! -d /home/$(USER)/data/wordpress ] || [ ! -d /home/$(USER)/data/database ]; then \
		mkdir -p /home/$(USER)/data/wordpress /home/$(USER)/data/database; \
	fi
	$(DOCKER_COMPOSE) up --build --detach

# stopping and removing all docker containers, network, images and volumes
down:
	$(DOCKER_COMPOSE) down

# building docker images
build:
	$(DOCKER_COMPOSE) build --no-cache

# dry run to check if docker compose works
dry-run:
	$(DOCKER_COMPOSE) --dry-run up --build -d

info:
	@echo "Container Info:"
	@docker ps -a
	@echo
	@echo "Images Info:"
	@docker images
	@echo
	@echo "Network Info:"
	@docker network ls
	@echo
	@echo "Volume Info:"
	@docker volume ls

# get logs for specific service
logs-%:
	$(DOCKER_COMPOSE) logs -f $*

# run container in shell
exec-%:
	$(DOCKER_COMPOSE) exec -it $* /bin/sh

clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes

.PHONY: all up down build dry-run info logs-% clean
