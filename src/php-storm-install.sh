#!/usr/bin/env bash

sudo apt-get purge openjdk*
sudo add-apt-repository ppa:webupd8team/java

sudo apt-get update

sudo apt-get install oracle-java8-installer -y
sudo apt-get install oracle-java8-set-default -y

sudo mkdir -pv /usr/local/software/phpStorm
cd /usr/local/software/phpStorm

sudo wget http://download-cf.jetbrains.com/webide/PhpStorm-2017.3.6.tar.gz

sudo tar -xvf /usr/local/software/phpStorm/PhpStorm-2017.3.6.tar.gz

sudo mv /usr/local/software/phpStorm/PhpStorm-*/* /usr/local/software/phpStorm/

sudo rm -R /usr/local/software/phpStorm/PhpStorm-*

ln -s /usr/local/software/phpStorm/bin/phpstorm.sh /usr/local/bin/phpStorm

phpStorm
