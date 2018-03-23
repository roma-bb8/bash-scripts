#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install curl -y
sudo apt-get install git -y
sudo apt-get install subversion -y

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

composer --version
