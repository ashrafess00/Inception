FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y vsftpd

RUN mkdir -p /var/run/vsftpd/empty


COPY conf/init.sh /init.sh
COPY conf/vsftpd.conf  /etc/vsftpd/vsftpd.conf 


EXPOSE 20 21

ENTRYPOINT [ "sh", "init.sh" ]

CMD ["vsftpd"]