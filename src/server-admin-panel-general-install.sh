#!/usr/bin/env bash

/usr/local/mysql/bin/mysql -um2e -p1qwerty2 <<MY_SQL_SCRIPT
DROP DATABASE IF EXISTS `server_admin_panel_general`;
CREATE DATABASE IF NOT EXISTS `server_admin_panel_general` CHARACTER SET UTF8 COLLATE utf8_general_ci;
MY_SQL_SCRIPT

sudo mkdir -p /var/www/server_admin_panel_general

echo 'db:           127.0.0.1'
echo 'db_name:      server_admin_panel_general'
echo 'user:         m2e'
echo 'password:     1qwerty2'

echo 'Checkout from svn server_admin_panel_general'
echo 'Create config'
echo 'composer install'
echo 'Install table in database'

cat > /var/www/server_worker/.htaccess <<EOF
<IfModule mod_rewrite.c>

    RewriteEngine On

    RewriteBase /

    RewriteCond %{THE_REQUEST} /public/([^\s?]*) [NC]
    RewriteRule ^ %1 [L,NE,R=302]

    RewriteRule ^((?!public/).*)$ public/$1 [L,NC]

</IfModule>
EOF
