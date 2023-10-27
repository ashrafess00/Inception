

# INTRODUCTION TO DEVOPS

42 inception is an amazing projects which teached us not only the basics, but also the intermediate concepts of containerization, by building mariadb, nginix and also wordpress, connecting them with docker compose
here i will give you what i did in this project and simple commands which will help you

## What is Docker?
Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker's methodologies for shipping, testing, and deploying code, you can significantly reduce the delay between writing code and running it in production.[click for more info](https://docs.docker.com/get-started/overview/)

before using docker compose i prefered to understand all those tecknologies invidually, running and set up them manually then building the Dockerfile for each of them, that's why i will show commands required below and each tecknology and what does it mean,

## Nginx
Nginx is a web server and also can used a reverse proxy or load balancer and so on.., in this project we had to create a self-signed ssl certificate for nginx, therefor a  `/etc/ssl/private` directory will be created to keep the private key file. Since the secrecy of this key is essential for security, it’s important to lock down the permissions to prevent unauthorized access:
`sudo mkdir /etc/ssl/private`
`sudo chmod 700 /etc/ssl/private`
then we create the certificate with openssl
`sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt`

now we have the certificate, it's time to configure nginx to use it, you have for this porpuse to create a block in a file ends with `.conf` in this directory `/etc/nginx/conf.d`, the file will contains this

    server {
        listen 443 http2 ssl;
        listen [::]:443 http2 ssl;
    
      server_name your_server_ip;
    
        ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
        ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
        ssl_dhparam /etc/ssl/certs/dhparam.pem;
    }
this was a very simple explaination about nginx, of course there a lot to learn about it like directives etc, resources are below to check out more about this intersting web server

* [How To Create a Self-Signed SSL Certificate for Nginx on CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-centos-7)
* [Nginx location directive examples](https://www.digitalocean.com/community/tutorials/nginx-location-directive)

## Mariadb

we have to build a mariadb docker image, so those are commands i used to create user etc
**install mariadb :**

    sudo apt-get install mariadb-server mariadb-client -y

`mysql_secure_installation` is essential to take steps to ensure that your database server is not vulnerable to unauthorized access or other security threats. this script basically provide a series of prompts and actions to enhance the security of your MySQL

but instead of using this script, i prefered to type in init.sql commands which are used by this command (automate it), [read more](https://bertvv.github.io/notes-to-self/2015/11/16/automating-mysql_secure_installation/)

those some command to setup the database, i created a user, and tables
**Create user**

    CREATE  USER 'user'@'localhost' IDENTIFIED BY  'password';

 **Create database and tables**
    CREATE  DATABASE  IF  NOT  EXISTS mydbo;
    USE mydbo;
 

    CREATE  TABLE  IF  NOT  EXISTS users (
	    id INT AUTO_INCREMENT PRIMARY KEY,
	    username VARCHAR(50) NOT NULL,
	    age INT
    );
    
    INSERT INTO users (username, age) VALUES ('Me-Test', 23);

## Wordpress
**what is wordpress**
WordPress is one of the world’s most simple and popular content management systems or CMS for short. This means you provide the content while the platform does all the coding and organizing. If you’re looking for the right web builder to get your website started, WordPress is the way to go,[read more](https://www.bluehost.com/blog/what-is-wordpress/?psafe_param=1&utm_campaign=dsa_wordpress_PPC&utm_source=googleads&utm_medium=genericsearch&channelid=P61C101S570N0B5578A2D4499E0000V112&gclid=Cj0KCQjw1aOpBhCOARIsACXYv-fxpCtyHLagjkiUrPlWk2O3uRhBG2lzBh-YiAUXAQqnvfqubtMMwnIaAhZgEALw_wcB&gclsrc=aw.ds)

### Install wp-cli
[this official website shows all the steps needed to download and update wp-cli ](https://make.wordpress.org/cli/handbook/guides/installing/)

### Download wordpress using wp-cli**
first create a directory in `/etc/www/html/wordpress` and enter to it

`sudo wp core download --allow-root`

### configure the database:
this command will generate a file inside wordpress directory named as wp-config.php, and connect it to database

    wp core config --dbhost=host.db \
    --dbname=prefix_db \
    --dbuser=username \
    --dbpass=password

### Configure wp-config.php

    sudo wp core install \
    --url=http://localhost \
    --title=title \
    --admin_user=admin \
    --admin_password=password \
    --admin_email=admin@email.com \
    --allow-root
    
### create a user
    wp user create \
    > username \
    > newuser@email.com \
    > --role=role [ex:--role=editor] \
    > --user_pass=password

## Docker compose v2
Literally you cannot feel that docker compose is so powerful unless if you were running, stopping and running containers, one by one, after simple changes you make.
docker compose is a tool that simply makes you run multiple containers with one command `docker compose up`, and stop and delete running containers `docker compose down`,  and it's responsible for creating volumes, networks and so by creating a yaml file `docker-compose.yml` and give it instruction
[...]