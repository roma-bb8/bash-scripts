#!/usr/bin/env bash
########################################
# sudo nano /etc/apache2/envvars
# ----------------------------------------
# export APACHE_RUN_USER=m2e
# export APACHE_RUN_GROUP=www-data
# ----------------------------------------
########################################
# Добовляем пользователя m2e в группу apache2
sudo usermod -a -G www-data m2e
########################################
# sudo chown -R m2e:www-data /var/www
sudo chmod -R 0775 /var/www
sudo service apache2 restart

########################################
mysql -um2e -p1qwerty2
DROP DATABASE IF EXISTS `magento_2`;
DROP DATABASE IF EXISTS `server_worker`;
DROP DATABASE IF EXISTS `server_panel_admin`;
CREATE DATABASE IF NOT EXISTS `magento_2` CHARACTER SET UTF8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `server_worker` CHARACTER SET UTF8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `server_admin_panel_general` CHARACTER SET UTF8 COLLATE utf8_general_ci;
EXIT;
########################################

######################################## Docker Install ########################################

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -y docker-engine
sudo systemctl status docker
sudo usermod -aG docker $(whoami)
# пЕРЕЗАГРУЗИТЬ КОМП


######################################## Server Worker Install ########################################
#db             admin 1qwerty2 server_worker
# checkout)
# create config
# composer install
# install table database
# copy and open app\data\component\ebay\marketplaces_build/*
# copy and open vars\temp\component\ebay\marketplaces_build/*

#url            http://server-worker.local/public/index.php

######################################## Server Admin Panel General Install ########################################
#db             admin 1qwerty2 server_admin_panel_general
# checkout)
# create config
# composer install
# install table database

#url            http://server-admin-panel-general.local/public/index.php

# Кроны

# crontab -e
# ----------------------------------------
# SHELL=/bin/bash
# MAILTO=m2e
# * * * * * php -f /var/www/server_worker/public/cron.php
# * * * * * php -f /var/www/magento_1/cron.php
# * * * * * /var/www/magento_2/bin/magento cron:run
# ----------------------------------------
# crontab -l

# while true; do php -f /var/www/server_worker/public/cron.php; echo -e  '\n--------------------------------------------------------------------------------'; sleep 60; done;
# while true; do php -f /var/www/magento_1/cron.php;            echo -e  '\n--------------------------------------------------------------------------------'; sleep 60; done;
# while true; do /var/www/magento_2/bin/magento cron:run        echo -e  '\n--------------------------------------------------------------------------------'; sleep 60; done;
