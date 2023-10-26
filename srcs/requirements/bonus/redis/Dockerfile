FROM debian:bookworm

FROM debian:bookworm

RUN apt-get update && apt-get install -y redis-server

# Copy the configuration script to the container
COPY conf/conf_it.sh /conf_it.sh

EXPOSE 6379

# Set the entry point to run the configuration script
ENTRYPOINT [ "sh", "conf_it.sh" ]

CMD [ "redis-server", "--protected-mode", "no" ]