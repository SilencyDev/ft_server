#SSL
mkdir etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Nice/L=Nice/O=42 School/OU=kevin/CN=localhost"

#NGINX
mkdir var/www/localhost
mv ./default etc/nginx/sites-available
ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#MYSQL
service mysql start
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root;
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'pma'@'localhost' IDENTIFIED BY 'pmapass';" | mysql -u root;
echo "FLUSH PRIVILEGES;" | mysql -u root;

#PHPMYADMIN
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages /var/www/localhost/phpmyadmin
cp -pr ./config.inc.php var/www/localhost/phpmyadmin


#STARTUP
service nginx start
service mysql restart
service php7.3-fpm start
sleep infinity
