#!/bin/sh

cd /var/www/html/wordpress
rm -rf /var/www/html/wordpress/*
wp core download --allow-root


# wordpress database
wp config create \
--dbname=${MYSQL_DB} \
--dbuser=${MYSQL_USER} \
--dbpass=${MYSQL_PASSWORD} \
--dbhost=mariadbc:3306 \
--allow-root

# change file permission for wp-config.php
chmod 600 /var/www/html/wordpress/wp-config.php

#install the them
wp theme install twentytwentytwo --allow-root

# Configure wp-config.php add admin
wp core install \
--url=aessaoud.42.fr \
--title="Ash Title" \
--admin_name=${ADMIN_NAME} \
--admin_password=${ADMIN_PASSWORD} \
--admin_email=${ADMIN_EMAIL} \
--allow-root
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

exec "$@"

