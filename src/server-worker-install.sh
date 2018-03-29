#!/usr/bin/env bash

/usr/local/mysql/bin/mysql -um2e -p1qwerty2 <<MY_SQL_SCRIPT
DROP DATABASE IF EXISTS `server_worker`;
CREATE DATABASE IF NOT EXISTS `server_worker` CHARACTER SET UTF8 COLLATE utf8_general_ci;
CREATE USER 'default'@'trigger' IDENTIFIED BY '';
GRANT TRIGGER, UPDATE ON * . * TO 'default'@'trigger';

FLUSH PRIVILEGES;
MY_SQL_SCRIPT

sudo mkdir -p /var/www/server_worker

echo 'db:           127.0.0.1'
echo 'db_name:      server_worker'
echo 'user:         m2e'
echo 'password:     1qwerty2'

echo 'Checkout from svn server_worker'
echo 'Create config'
echo 'composer install'
echo 'Install table in database'

sudo mkdir -pv /var/www/server_worker/app/data/component/ebay/marketplaces_build/*
sudo mkdir -pv /var/www/server_worker/vars/temp/component/amazon/marketplaces_build/

echo 'sudo cp /var/www/server_worker/app/data/component/ebay/marketplaces_build/* /var/www/server_worker/vars/temp/component/ebay/marketplaces_build/'
echo 'sudo cp /var/www/server_worker/app/data/component/amazon/marketplaces_build/* /var/www/server_worker/vars/temp/component/amazon/marketplaces_build/'

echo 'Crone'
echo 'crontab -e'
echo '* * * * * php -f /var/www/server_worker/public/cron.php';
echo 'crontab -l';
echo 'OR';
echo 'while true; do php -f /var/www/server_worker/public/cron.php; echo -e  '\n----------------------------------------'; sleep 60; done;';

cat > /var/www/server_worker/.htaccess <<EOF
<IfModule mod_rewrite.c>

    RewriteEngine On

    RewriteBase /

    RewriteCond %{THE_REQUEST} /public/([^\s?]*) [NC]
    RewriteRule ^ %1 [L,NE,R=302]

    RewriteRule ^((?!public/).*)$ public/$1 [L,NC]

</IfModule>
EOF
