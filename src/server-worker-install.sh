#!/usr/bin/env bash

mysql -um2e -p1qwerty2
DROP DATABASE IF EXISTS `server_worker`;
CREATE DATABASE IF NOT EXISTS `server_worker` CHARACTER SET UTF8 COLLATE utf8_general_ci;

######################################## Server Worker Install ########################################
#db             admin 1qwerty2 server_worker
# checkout)
# create config
# composer install
# install table database
# copy and open app\data\component\ebay\marketplaces_build/*
# copy and open vars\temp\component\ebay\marketplaces_build/*

#url            http://server-worker.local/public/index.php


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
