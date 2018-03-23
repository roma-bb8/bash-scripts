#!/usr/bin/env bash
mysql -um2e -p1qwerty2
DROP DATABASE IF EXISTS `server_admin_panel_general`;
CREATE DATABASE IF NOT EXISTS `server_admin_panel_general` CHARACTER SET UTF8 COLLATE utf8_general_ci;

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
# SHELL=/src/bash
# MAILTO=m2e
# * * * * * php -f /var/www/server_worker/public/cron.php
# * * * * * php -f /var/www/magento_1/cron.php
# * * * * * /var/www/magento_2/src/magento cron:run
# ----------------------------------------
# crontab -l

# while true; do php -f /var/www/server_worker/public/cron.php; echo -e  '\n--------------------------------------------------------------------------------'; sleep 60; done;
# while true; do php -f /var/www/magento_1/cron.php;            echo -e  '\n--------------------------------------------------------------------------------'; sleep 60; done;
# while true; do /var/www/magento_2/src/magento cron:run        echo -e  '\n--------------------------------------------------------------------------------'; sleep 60; done;
