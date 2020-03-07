export TENSORBOARD_PORT := 7777
export USER_ID          := $(shell id -u)   # will fetch local user id... make sure it's the same on server
export USER_NAME        := $(shell id -un)  # will fetch local user name
export PROJ_NAME        := pt-tb-docker
export COMPOSE_CMD      := docker-compose -f docker/docker-compose.yaml
#export DAEMON_SOCKET    := -H ssh:<insert remote>
export DAEMON_SOCKET    := 

build:
	$(COMPOSE_CMD) $(DAEMON_SOCKET) build
up:
	$(COMPOSE_CMD) $(DAEMON_SOCKET) up --detach
down:
	$(COMPOSE_CMD) $(DAEMON_SOCKET) down
connect: up
	$(COMPOSE_CMD) $(DAEMON_SOCKET) exec interactive bash