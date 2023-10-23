FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=localhost"


COPY ./conf/wordpress.conf /etc/nginx/conf.d/wordpress.conf

#portfolio
COPY tools/* /var/www/html/portfolio/

RUN chmod -R 755 /var/www/html/portfolio


EXPOSE 443


CMD ["nginx", "-g", "daemon off;"]





