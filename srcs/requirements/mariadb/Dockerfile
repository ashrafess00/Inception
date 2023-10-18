FROM debian:bookworm

# Install necessary packages (MariaDB client, server, and other dependencies)
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

RUN mkdir -p scripts
RUN sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g"  /etc/mysql/mariadb.conf.d/50-server.cnf


COPY conf/init_db.sh scripts/init_db.sh

RUN chmod +x scripts/init_db.sh

# Expose the MariaDB port
EXPOSE 3306

# Start MariaDB when the container is run
ENTRYPOINT [ "sh", "scripts/init_db.sh" ]

CMD ["mariadbd", "--user=root"]