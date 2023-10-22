FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y vsftpd

RUN mkdir -p /var/run/vsftpd/empty


COPY conf/vsftpd.conf  /etc/vsftpd/vsftpd.conf 
COPY conf/init.sh /init.sh


ENTRYPOINT [ "sh", "init.sh" ]
