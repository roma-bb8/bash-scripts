#!/usr/bin/env bash

sudo apt-get install python-software-properties -y
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

sudo apt-get update

sudo apt-get install php7.0 -y
sudo apt-get install php7.0-cli -y
sudo apt-get install php7.0-common -y
sudo apt-get install php7.0-json -y
sudo apt-get install php7.0-xml -y
sudo apt-get install php7.0-curl -y
sudo apt-get install php7.0-soap -y
sudo apt-get install php-mongodb -y
sudo apt-get install php7.0-mysql -y
sudo apt-get install php7.0-mcrypt -y
sudo apt-get install php7.0-gd -y
sudo apt-get install php7.0-mbstring -y
sudo apt-get install php7.0-intl -y
sudo apt-get install php7.0-zip -y
sudo apt-get install php7.0-xsl -y
sudo apt-get install php7.0-iconv -y
