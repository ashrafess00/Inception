#!/bin/sh

mkdir -p /var/www/html/adminer
wget https://www.adminer.org/latest.php -O /var/www/html/adminer/index.php

php-fpm8.2 -F