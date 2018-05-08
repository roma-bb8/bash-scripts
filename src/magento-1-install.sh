#!/usr/bin/env bash

/usr/local/mysql/bin/mysql -um2e -p1qwerty2 <<MY_SQL_SCRIPT
DROP DATABASE IF EXISTS `magento_1`;
CREATE DATABASE IF NOT EXISTS `magento_1` CHARACTER SET UTF8 COLLATE utf8_general_ci;
MY_SQL_SCRIPT

sudo mkdir -p /var/www/magento_1

cd /var/www/magento_1

sudo git clone https://github.com/OpenMage/magento-mirror.git .

sudo wget https://raw.githubusercontent.com/Vinai/compressed-magento-sample-data/1.9.1.0/compressed-magento-sample-data-1.9.1.0.tgz

sudo tar -xvf /var/www/magento_1/compressed-magento-sample-data-1.9.1.0.tgz

sudo mv /var/www/magento_1/magento-sample-data-1.9.1.0/* .

mysql -um2e -p1qwerty2 magento_1 < /var/www/magento_1/magento_sample_data_for_1.9.1.0.sql

sudo rm /var/www/magento_1/compressed-magento-sample-data-1.9.1.0.tgz
sudo rm -R /var/www/magento_1/magento-sample-data-1.9.1.0
sudo rm /var/www/magento_1/magento_sample_data_for_1.9.1.0.sql

echo 'db:       127.0.0.1'
echo 'db_name:  magento_1'
echo 'user:     m2e'
echo 'password: 1qwerty2'

echo 'first name:           Santa'
echo 'last name:            Claus'
echo 'mail user:            santa@claus.org'
echo 'admin login:          m2e'
echo 'admin password:       1qwerty2'

echo '#1 System -> Configuration -> Admin [Section] -> Security [Section] -> Enable Form Key Validation On Checkout -> Yes [Save]'
echo '#2 Checkout from svn m2epro_magento_1'
echo '#3 Clean all cache'

sudo ln -s /var/www/magento_1/misc/additional_scripts/upgrade_database.php /var/www/magento_1/upgrade_database.php
sudo ln -s /var/www/magento_1/misc/additional_scripts/upgrade_upgrade.php /var/www/magento_1/upgrade_upgrade.php

echo 'Crone'
echo 'crontab -e'
echo '* * * * * php -f /var/www/magento_1/cron.php';
echo 'crontab -l';
echo 'OR';
echo 'while true; do php -f /var/www/magento_1/cron.php; echo -e  '\n----------------------------------------'; sleep 60; done;';
# app/code/core/Mage/Core/Controller/Varien/Action.php 418 <- Point alls controller run.
