openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $CERTS_KEY -out $CERTS_ -subj "/CN=localhost"

sed -i "s|ssl_certificate CERTS_|ssl_certificate $CERTS_|g" /etc/nginx/conf.d/wordpress.conf
sed -i "s|ssl_certificate_key CERTS_KEY|ssl_certificate_key $CERTS_KEY|g" /etc/nginx/conf.d/wordpress.conf

exec "$@"