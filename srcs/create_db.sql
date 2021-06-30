CREATE DATABASE wordpress_db;
CREATE USER 'user42'@'localhost' IDENTIFIED BY 'user42';
SET password FOR 'user42'@'localhost' = password('user42');
GRANT ALL PRIVILEGES ON *.* TO 'user42'@'localhost' IDENTIFIED BY 'user42' WITH GRANT OPTION;
GRANT SELECT, INSERT, DELETE, UPDATE ON phpmyadmin.* TO 'pma_user'@'localhost' IDENTIFIED BY "pma_password";
update mysql.user set plugin='' where user='user42';
FLUSH PRIVILEGES;
