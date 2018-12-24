#!/bin/bash

nohup mysqld_safe &

# Give some time to start mysql
sleep 5

echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('"$MYSQL_ROOT_PASSWORD"');
CREATE USER 'root'@'%' IDENTIFIED BY '"$MYSQL_ROOT_PASSWORD"';

GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '"$MYSQL_ROOT_PASSWORD"';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '"$MYSQL_ROOT_PASSWORD"';

CREATE USER '"$MYSQL_USER"'@'localhost' IDENTIFIED BY '"$MYSQL_PASSWORD"';
CREATE USER '"$MYSQL_USER"'@'%' IDENTIFIED BY '"$MYSQL_PASSWORD"';

GRANT ALL PRIVILEGES ON *.* TO '"$MYSQL_USER"'@'localhost' IDENTIFIED BY '"$MYSQL_PASSWORD"';
GRANT ALL PRIVILEGES ON *.* TO '"$MYSQL_USER"'@'%' IDENTIFIED BY '"$MYSQL_PASSWORD"';

CREATE DATABASE $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;

FLUSH PRIVILEGES;" > db_prepare.sql

mysql < db_prepare.sql


rm -f db_prepare.sql

tail -f /dev/null
