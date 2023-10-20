FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=localhost"


RUN mkdir -p /var/www/portfolio

COPY ./conf/wordpress.conf /etc/nginx/conf.d/wordpress.conf

COPY tools/* /var/www/portfolio/

RUN chmod -R 755 /var/www/portfolio
RUN chmod -R 644 /var/www/portfolio/* 
# COPY conf/portfolio.conf /etc/nginx/sites-available/portfolio.conf
# RUN ln -s /etc/nginx/sites-available/portfolio.conf /etc/nginx/sites-enabled/

EXPOSE 443


CMD ["nginx", "-g", "daemon off;"]





