#!/bin/sh

mysql_db="$HOME/data/mysql_db"
wordpress_path="$HOME/data/wordpress_path"


if [ ! -d "$mysql_db" ];then
    mkdir -p "$mysql_db" && chmod 777 $mysql_db
fi;

if [ ! -d "$wordpress_path" ];then
    mkdir -p "$wordpress_path" && chmod 777 $wordpress_path
fi;
