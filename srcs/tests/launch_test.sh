#!/bin/bash

if [ "$1" = "clean" ] ; then
	cd .. && rm -rf tests
	cd /var/www/localhost && rm -f info.php test.php test.html wallpaper.jpeg
	echo "DROP DATABASE IF EXISTS test_db" | mysql -u root
	echo "=> Cleaning Test Database and removing tests files [OK]"
else

### CREATE TEST DB
	echo "Creating Test Database..."
	mysql -u root < test_db.sql
	echo "=> Creating Test Database [OK]"


### COPYING FILES
	cp info.php test.php test.html wallpaper.jpeg /var/www/localhost/
	echo "=> Copying configuration files [OK]"
fi

### RESTARTING SERVICES
service nginx restart

