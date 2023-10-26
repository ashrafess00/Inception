#!/bin/sh


# create the user if is not created yet
if ! id -u "$FTP_USER" &>/dev/null ;then
    useradd $FTP_USER
    echo $FTP_USER:$FTP_PASSWORD | chpasswd
fi;

# change the home directory of this user to /var.../wordpress
usermod -d /var/www/html/wordpress $FTP_USER

mkdir -p /var/www/html/wordpress/ftp
chown -R $FTP_USER:$FTP_USER /var/www/html/wordpress/ftp
chmod -R 777 /var/www/html/wordpress/ftp

# create a test file inside the directory for testing
echo "vsftpd test file" | tee /var/www/html/wordpress/ftp/ftp.txt

echo $FTP_USER | tee -a /etc/vsftpd.userlist

exec "$@"
