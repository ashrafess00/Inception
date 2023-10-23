#!/bin/sh

mysql_db="$HOME/data/mysql_db"
wordpress_path="$HOME/data/wordpress_path"
adminer_path="$HOME/data/adminer_path"

if [ ! -d "$mysql_db" ];then
    mkdir -p "$mysql_db" && chmod 777 $mysql_db
    echo $mysql_db was created
fi;

if [ ! -d "$wordpress_path" ];then
    mkdir -p "$wordpress_path" && chmod 777 $wordpress_path
fi;

if [ ! -d "$adminer_path" ];then
    mkdir -p "$adminer_path" && chmod 777 $adminer_path
fi;

