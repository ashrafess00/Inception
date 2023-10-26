FROM debian:bookworm

RUN apt update && apt install -y php8.2 \
    php8.2-fpm \
    php8.2-mysql \
    wget

# change the php-fpm config to listen on all network avialable on port 8080
RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:8080|g" /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 8080

COPY conf/run.sh /run.sh

ENTRYPOINT [ "sh", "run.sh" ]

CMD [ "php-fpm8.2", "-F" ]