#!/bin/bash

green="\e[0;32m"
white="\e[0;m"


echo -e "[ ${green}ok${white} ] Updating"
echo -e "[ ${green}ok${white} ] Downloading nginx mySQL"



### Installing phpMyAdmin
#echo "Configuring phpMyAdmin..."
#wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
#tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
#mv phpMyAdmin-5.0.1-english phpMyAdmin
#cp config.inc.php phpMyAdmin/config.inc.php && rm -f config.inc.php
#echo -e "[ ${green}ok${white} ] Configuring phpMyAdmin"


### Installing Wordpress
#echo "Downloading Wordpress..."
#wget http://fr.wordpress.org/latest-fr_FR.tar.gz
#tar -xf latest-fr_FR.tar.gz && rm -f latest-fr_FR.tar.gz



### Copying config files
mkdir /var/www/localhost
cp -r wordpress /var/www/localhost/wordpress && rm -rf wordpress
#cp wp-config.php /var/www/localhost/wordpress/wp-config.php && rm -f wp-config.php
cp -r phpMyAdmin /var/www/localhost/phpMyAdmin && rm -rf phpMyAdmin
chown -R www-data:www-data *
chmod -R 755 /var/www/*
mkdir /var/www/localhost/phpMyAdmin/tmp && chmod 777 /var/www/localhost/phpMyAdmin/tmp
chmod 777 /var/www/localhost/wordpress/wp-content
echo -e "[ ${green}ok${white} ] Copying configuration files"



### Setting up nginx
openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=FRANCE/L=Paris/O=42fr/OU=42fr/CN=aldubar" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
cp localhost /etc/nginx/sites-available/localhost && rm -f localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
nginx -t
echo -e "[ ${green}ok${white} ] Configuring nginx"


### Creating Wordpress Database
service mysql start
mysql -u root < create_tables.sql && rm -f create_tables.sql
mysql -u root < create_db.sql && rm -f create_db.sql
echo -e "[ ${green}ok${white} ] Creating Wordpress Database"


### Restarting services
service nginx restart
service php7.3-fpm start
service php7.3-fpm status



### Enable/Disable Autoindex with environement variable
[ "$AUTOINDEX" = "on" -o "$AUTOINDEX" = "off" ] && ./autoindex.sh "$AUTOINDEX"


### Enable/Disable extra tests with env variable
[ "$TEST" = "y" -o "$TEST" = "o" ] && { cd tests; ./launch_test.sh; } || { cd tests; ./launch_test.sh clean; }


### PRINT LOGS
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
