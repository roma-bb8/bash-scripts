#!/usr/bin/env bash

sudo apt-get purge openjdk*
sudo add-apt-repository ppa:webupd8team/java

sudo apt-get update

sudo apt-get install oracle-java8-installer -y
sudo apt-get install oracle-java8-set-default -y

sudo mkdir -pv /opt/phpStorm
cd /opt/phpStorm

sudo wget http://download-cf.jetbrains.com/webide/PhpStorm-2017.3.6.tar.gz

sudo tar -xvf /opt/phpStorm/PhpStorm-2017.3.6.tar.gz

sudo mv /opt/phpStorm/PhpStorm-*/* /opt/phpStorm/

sudo rm -R /opt/phpStorm/PhpStorm-*

ln -s /opt/phpStorm/bin/phpstorm.sh /usr/local/bin/phpStorm

phpStorm
