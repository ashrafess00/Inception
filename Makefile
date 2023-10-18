all:
	sh ./srcs/requirements/tools/setup.sh
	docker compose -f ./srcs/docker-compose.yml up

down:
	docker compose -f ./srcs/docker-compose.yml down

down-v:
	docker compose -f ./srcs/docker-compose.yml down --volumes

clean:
	
