export TENSORBOARD_PORT := 7777
export USER_ID          := $(shell id -u)   
export USER_NAME        := $(shell id -un)  
export PROJ_NAME        := pt-tb-docker
export COMPOSE_CMD      := docker-compose -f docker/docker-compose.yaml
export DAEMON_SOCKET    := -H ssh:<insert remote>

build:
	$(COMPOSE_CMD) build
up:
	$(COMPOSE_CMD) up --detach
down:
	$(COMPOSE_CMD) down
connect: up
	$(COMPOSE_CMD) exec interactive bash
build_r:
	$(COMPOSE_CMD) $(DAEMON_SOCKET) build
up_r:
	$(COMPOSE_CMD) $(DAEMON_SOCKET) up --detach
down_r:
	$(COMPOSE_CMD) $(DAEMON_SOCKET) down
connect_r: up
	$(COMPOSE_CMD) $(DAEMON_SOCKET) exec interactive bash