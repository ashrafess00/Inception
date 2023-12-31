DOCKER_COMPOSE_FILE=./srcs/docker-compose.yml
SCRIPTS=./srcs/requirements/tools

all:
	sh $(SCRIPTS)/setup.sh
	docker compose -f $(DOCKER_COMPOSE_FILE) up --build -d

up: all

down:
	docker compose -f $(DOCKER_COMPOSE_FILE) down

stop:
	docker compose -f $(DOCKER_COMPOSE_FILE) stop

build:
	docker compose -f $(DOCKER_COMPOSE_FILE) build
restart:
	docker compose -f $(DOCKER_COMPOSE_FILE) restart
logs:
	docker compose -f $(DOCKER_COMPOSE_FILE) logs
clean:
	docker compose -f $(DOCKER_COMPOSE_FILE) down --rmi all
fclean: down
	sudo rm -rf ~/data
	docker compose -f $(DOCKER_COMPOSE_FILE) down -v --rmi all
