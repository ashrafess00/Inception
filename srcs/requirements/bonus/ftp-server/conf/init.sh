#!/bin/sh


#create ftp_user
useradd -m ${FTP_USER}

#give it a password
echo $FTP_USER:$FTP_PASSWORD | chpasswd

mkdir /home/$FTP_USER/ftp
chown nobody:nogroup /home/$FTP_USER/ftp
chmod a-w /home/$FTP_USER/ftp
mkdir /home/$FTP_USER/ftp/files
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files
echo $FTP_USER | tee -a /etc/vsftpd.userlist

exec "$@"