#!/bin/sh


useradd $FTP_USER
echo $FTP_USER:$FTP_PASSWORD | chpasswd

usermod -d /var/www/html/wordpress $FTP_USER

mkdir -p /var/www/html/wordpress/ftp
chown -R $FTP_USER:$FTP_USER /var/www/html/wordpress/ftp
chmod -R 777 /var/www/html/wordpress/ftp


echo "vsftpd test file" | tee /var/www/html/wordpress/ftp/ftp.txt

echo $FTP_USER | tee -a /etc/vsftpd.userlist

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf


