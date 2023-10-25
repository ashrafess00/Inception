FROM debian:bookworm

#creating the portfolio dir
RUN mkdir -p /var/www/html/portfolio

#copy the portfolio assets to it
COPY assets/* /var/www/html/portfolio

#grant the permissions
RUN chmod -R 755 /var/www/html/portfolio