#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install php-xdebug -y

PHP_STORM=PHP_STORM

sudo echo "XDEBUG_CONFIG=idekey=${PHP_STORM}"   >> ~/.profile

sudo echo "xdebug.cli_color = 1"                >> /etc/php/7.0/mods-available/xdebug.ini
sudo echo "xdebug.show_error_trace = 1"         >> /etc/php/7.0/mods-available/xdebug.ini
sudo echo "xdebug.remote_autostart = 0"         >> /etc/php/7.0/mods-available/xdebug.ini
sudo echo "xdebug.remote_enable = 1"            >> /etc/php/7.0/mods-available/xdebug.ini
sudo echo "xdebug.remote_host = 127.0.0.1"      >> /etc/php/7.0/mods-available/xdebug.ini
sudo echo "xdebug.remote_port = 9000"           >> /etc/php/7.0/mods-available/xdebug.ini
sudo echo "xdebug.idekey = ${PHP_STORM}"        >> /etc/php/7.0/mods-available/xdebug.ini

sudo service apache2 restart
