#!/usr/bin/env bash

sudo apt-get install apache2 -y
sudo a2enmod rewrite
sudo service apache2 restart

systemctl status apache2.service

echo 'info /etc/apache2/envvars';
echo '...';
echo 'export APACHE_RUN_USER=www-data';
echo 'export APACHE_RUN_GROUP=www-data';

echo 'Add user to www-data group';
echo 'sudo usermod -a -G www-data m2e';

echo 'Delete user form www-data group';
echo 'sudo gpasswd -d m2e www-data';

echo 'sudo chown -R www-data:www-data /var/www';
echo 'sudo chmod -R 0775 /var/www';
