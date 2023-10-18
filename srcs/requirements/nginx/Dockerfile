FROM debian:latest


RUN apt-get update && \
    apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=localhost"


# RUN mkdir -p /var/www/html/wordpress/public_html

COPY ./conf/wordpress.conf /etc/nginx/conf.d/wordpress.conf


EXPOSE 443


CMD ["nginx", "-g", "daemon off;"]





