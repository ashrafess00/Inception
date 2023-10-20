#!/bin/sh

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

#stop the containers
docker compose -f ./srcs/docker-compose.yml down  --volumes
if [ $? -eq 0 ];then
    echo nono
else
    echo "${RED}AN ERROR OCCURED WHILE REMOVING${RESET}"
fi;



# docker rm $(docker ps -a -q)
# docker rmi $(docker images -q)
# docker volume rm $(docker volume ls -q)
# docker network rm $(docker network ls -q)
# docker system prune -a