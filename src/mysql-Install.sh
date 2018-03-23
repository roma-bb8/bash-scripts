#!/usr/bin/env bash

# sudo debconf-set-selections <<< 'mysql-community-server mysql-community-server/root-pass password toor'
# sudo debconf-set-selections <<< 'mysql-community-server mysql-community-server/re-root-pass password toor'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password toor'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password toor'

sudo apt-get install mysql-server -y

systemctl status mysql.service

/usr/local/mysql/bin/mysql -uroot -ptoor <<MY_SQL_SCRIPT

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

CREATE USER 'm2e'@'localhost' IDENTIFIED BY '1qwerty2';
GRANT CREATE, SELECT, INSERT, UPDATE, DELETE, DROP ON * . * TO 'm2e'@'localhost';

FLUSH PRIVILEGES;
MY_SQL_SCRIPT

# GRANT ALL PRIVILEGES ON * . * TO 'm2e'@'localhost';
# REVOKE ALL PRIVILEGES ON *.* FROM 'm2e'@'localhost';
# DROP USER 'm2e'@'localhost';
