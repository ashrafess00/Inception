FROM debian:bookworm

#creating the portfolio dir
RUN mkdir -p /var/www/html/portfolio

#copy the portfolio assets to it
COPY assets/* /var/www/html/portfolio

COPY conf/run.sh /run.sh
COPY conf/portfolio.conf /portfolio.conf

#grant the permissions
RUN chmod -R 755 /var/www/html/portfolio

ENTRYPOINT [ "sh", "run.sh" ]