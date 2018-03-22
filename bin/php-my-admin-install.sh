#!/usr/bin/env bash

cd /tmp

wget https://files.phpmyadmin.net/phpMyAdmin/4.7.9/phpMyAdmin-4.7.9-all-languages.zip

unzip /tmp/phpMyAdmin-4.7.9-all-languages.zip

sudo mkdir -p /var/www/php_my_admin

sudo mv /tmp/phpMyAdmin-4.7.9-all-languages/* /var/www/php_my_admin/

rm /tmp/phpMyAdmin-4.7.9-all-languages.zip
rm -R /tmp/phpMyAdmin-4.7.9-all-languages

sudo cp /var/www/php_my_admin/config.sample.inc.php /var/www/php_my_admin/config.inc.php

echo "sudo nano /var/www/php_my_admin/config.inc.php"
echo "-> \$cfg['blowfish_secret'] = ''; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */"
echo "to -> \$cfg['blowfish_secret'] = 'qtdRoGmbc9{8IZr323xYcSN]0s)r\$9b_JUnb{~Xz';"
echo "sudo service apache2 restart"

echo "URL:  http://php-my-admin.local/"
echo "Credentials       root: root => toor"
echo "Credentials (rec) m2e:  m2e  => 1qwerty2"
