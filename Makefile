all:
	sh ./srcs/requirements/tools/setup.sh
	docker compose -f  ./srcs/docker-compose.yml  up

stop:
	docker compose -f  ./srcs/docker-compose.yml stop

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	docker compose -f ./srcs/docker-compose.yml down --volumes
	docker rmi $$(docker images -q)

