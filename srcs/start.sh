#SSL
mkdir etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Nice/L=Nice/O=42 School/OU=kevin/CN=localhost"

#NGINX
mkdir var/www/localhost
mv ./default etc/nginx/sites-available/
chown -R www-data /var/www/*
chmod -R 777 /var/www/*

#MYSQL
service mysql start
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root;
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'kevin'@'localhost' IDENTIFIED BY 'password';" | mysql -u root;
echo "FLUSH PRIVILEGES;" | mysql -u root;

#PHPMYADMIN
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages /var/www/localhost/phpmyadmin
mv ./config.inc.php var/www/localhost/phpmyadmin
mkdir /var/www/localhost/phpmyadmin/tmp
chmod 777 /var/www/localhost/phpmyadmin/tmp
chown -R www-data:www-data /var/www/localhost/phpmyadmin
service php7.3-fpm start
echo "GRANT ALL PRIVILEGES ON *.* TO 'kevin'@'localhost' IDENTIFIED BY 'password';" | mysql -u root;
echo "FLUSH PRIVILEGES" | mysql -u root;

#WORDPRESS
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress /var/www/localhost/wordpress
mv ./wp-config.php /var/www/localhost/wordpress

#WORDPRESS_INSTALL
service mysql restart
service php7.3-fpm restart
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp --allow-root core install --url="localhost/wordpress" --path=/var/www/localhost/wordpress/ --title="a title" --admin_user="silency" --admin_password="strongpassword" --admin_email="test@test.fr"

#STARTUP
service nginx start
service mysql restart
service php7.3-fpm restart
sleep infinity
