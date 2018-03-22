#!/usr/bin/env bash

sudo apt-get install apache2 -y
sudo a2enmod rewrite
sudo service apache2 restart

systemctl status apache2.service
