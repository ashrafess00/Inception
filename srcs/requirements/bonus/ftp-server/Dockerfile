FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y vsftpd openssl

RUN mkdir -p /var/run/vsftpd/empty

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/CN=localhost"

COPY conf/vsftpd.conf  /etc/vsftpd/vsftpd.conf 
COPY conf/init.sh /init.sh


ENTRYPOINT [ "sh", "init.sh" ]
