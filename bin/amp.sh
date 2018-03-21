#!/usr/bin/env bash

# First install xubuntu 16.04 LTS

sudo apt-get remove fonts-opensymbol libreoffice libreoffice-\* openoffice.org-dtd-officedocument1.0 python\*-uno uno-libs3-\* ure ure-dbg
sudo apt-get remove --purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove
sudo apt-get update
sudo apt-get upgrade -y

# User: root  =>  toor
# User: m2e   =>  1qwerty2

# Задаем пароль root пользователю toor
sudo passwd

######################################## Apache 2 Install ########################################
sudo apt-get update
sudo apt-get install apache2
sudo a2enmod rewrite
sudo service apache2 restart
########################################
# sudo nano /etc/apache2/envvars
# ----------------------------------------
# export APACHE_RUN_USER=m2e
# export APACHE_RUN_GROUP=www-data
# ----------------------------------------
sudo nano /etc/apache2/apache2.conf
----------------------------------------
<Directory /var/www/>
    Options Indexes FollowSymLinks MultiViews
    AllowOverride All
    Order allow,deny
    allow from all
</Directory>
----------------------------------------

########################################
# Добовляем пользователя m2e в группу apache2
sudo usermod -a -G www-data m2e
########################################
# sudo chown -R m2e:www-data /var/www
sudo chmod -R 0775 /var/www
sudo service apache2 restart

######################################## Apache 2 Config ########################################
sudo nano /etc/apache2/sites-enabled/000-default.conf
----------------------------------------
<VirtualHost *:80>
        ServerAdmin m2e@localhost
        DocumentRoot /var/www/localhost
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
########################################

sudo nano /etc/apache2/sites-available/php-my-admin.local.conf
----------------------------------------
<VirtualHost *:80>
    ServerAdmin m2e@localhost
    ServerName php-my-admin.local
    ServerAlias www.php-my-admin.local
    DocumentRoot /var/www/php_my_admin
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
########################################

sudo a2ensite php-my-admin.local.conf
----------------------------------------
sudo nano /etc/apache2/sites-available/magento-1.local.conf
<VirtualHost *:80>
    ServerAdmin m2e@localhost
    ServerName magento-1.local
    ServerAlias www.magento-1.local
    DocumentRoot /var/www/magento_1
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
sudo a2ensite magento-1.local.conf
########################################

sudo nano /etc/apache2/sites-available/magento-2.local.conf
----------------------------------------
<VirtualHost *:80>
    ServerAdmin m2e@localhost
    ServerName magento-2.local
    ServerAlias www.magento-2.local
    DocumentRoot /var/www/magento_2.local
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
sudo a2ensite magento-2.local.conf
########################################

----------------------------------------
sudo nano /etc/apache2/sites-available/server-worker.local.conf
<VirtualHost *:80>
    ServerAdmin m2e@localhost
    ServerName server-worker.local
    ServerAlias www.server-worker.local
    DocumentRoot /var/www/server_worker
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
sudo a2ensite server-worker.local.conf
########################################

----------------------------------------
sudo nano /etc/apache2/sites-available/server-admin-panel-general.local.conf
<VirtualHost *:80>
    ServerAdmin m2e@localhost
    ServerName server-admin-panel-general.local
    ServerAlias www.server-admin-panel-general.local
    DocumentRoot /var/www/server_admin_panel_general
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
sudo a2ensite server-admin-panel-general.local.conf
########################################

mkdir /var/www/localhost
mkdir /var/www/php_my_admin
mkdir /var/www/magento_1
mkdir /var/www/magento_2
mkdir /var/www/server_worker
mkdir /var/www/server_admin_panel_general
rm -R /var/www/html
sudo service apache2 restart
rm -R /var/www/magento_2

########################################
sudo nano /etc/hosts
----------------------------------------
127.0.0.1       localhost
127.0.1.1       guest
127.0.0.101     php-my-admin.local
127.0.0.102     magento-1.local
127.0.0.103     magento-2.local
127.0.0.104     server-worker.local
127.0.0.105     server-admin-panel-general.local
########################################

######################################## PHP 7.0.x Install ########################################
sudo apt-get install -y python-software-properties
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
sudo apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip php7.0-soap php7.0-curl -y
sudo apt-get update -y

######################################## MySQL Install ########################################
sudo apt-get install mysql-server
systemctl status mysql.service

########################################
cd /usr/local/mysql/bin
mysql -u root -p
ALTER USER 'root'@'localhost' IDENTIFIED BY 'toor';
CREATE USER 'admin'@'localhost' IDENTIFIED BY '1qwerty2';
GRANT CREATE, SELECT, INSERT, UPDATE, DELETE, DROP ON * . * TO 'admin'@'localhost';
# GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';
# REVOKE ALL PRIVILEGES ON *.* FROM 'non-root'@'localhost';
# DROP USER 'admin'@'localhost';
FLUSH PRIVILEGES;
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
EXIT;
mysql -uadmin -p1qwerty2
DROP DATABASE IF EXISTS `magento_1`;
DROP DATABASE IF EXISTS `magento_2`;
DROP DATABASE IF EXISTS `server_worker`;
DROP DATABASE IF EXISTS `server_panel_admin`;
CREATE DATABASE IF NOT EXISTS `magento_1` CHARACTER SET UTF8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `magento_2` CHARACTER SET UTF8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `server_worker` CHARACTER SET UTF8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `server_admin_panel_general` CHARACTER SET UTF8 COLLATE utf8_general_ci;
EXIT;
########################################

######################################## PHPMyAdmin Install ########################################

cd /var/www
sudo wget https://files.phpmyadmin.net/phpMyAdmin/4.7.9/phpMyAdmin-4.7.9-all-languages.zip
sudo unzip phpMyAdmin-4.7.9-all-languages.zip
sudo mv phpMyAdmin-4.7.9-all-languages/ php_my_admin/
# $cfg['blowfish_secret'] = 'qtdRoGmbc9{8IZr323xYcSN]0s)r$9b_JUnb{~Xz'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */
sudo mkdir php_my_admin/config/
sudo service apache2 restart

######################################## Composer Install ########################################

sudo apt-get update
sudo apt-get install curl git subversion
curl -sS https://getcomposer.org/installer | sudo php --install-dir=/usr/local/bin --filename=composer

######################################## Google Chrome Install ########################################

cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -f install
rm /tmp/google-chrome-stable_current_amd64.deb

######################################## PHPStorm Install ########################################

sudo apt-get purge openjdk*
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer oracle-java8-set-default

cd /usr/local/bin
wget http://download-cf.jetbrains.com/webide/PhpStorm-2017.1.5.ta‌​r.gz
tar -xvf PhpStorm-2017.1.5.ta‌​r.gz
cd PhpStorm-171.4694.2/bin/
rm ./PhpStorm-2017.1.5.ta‌​r.gz
./phpstorm.sh

######################################## xDebug Install ########################################

sudo apt-get install php-xdebug
sudo nano /etc/php/7.0/mods-available/xdebug.ini
----------------------------------------
xdebug.remote_enable = 1
xdebug.remote_port = 9000
xdebug.idekey = PHP_STORM
xdebug.show_error_trace = 1
xdebug.remote_autostart = 0
xdebug.file_link_format = phpstorm://open?%f:%l
----------------------------------------
sudo service apache2 restart

######################################## Skype Install ########################################

sudo dpkg --add-architecture i386
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update && sudo apt-get install skype


######################################## Docker Install ########################################

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -y docker-engine
sudo systemctl status docker
sudo usermod -aG docker $(whoami)
# пЕРЕЗАГРУЗИТЬ КОМП

######################################## Node.JS Install ########################################

sudo apt-get install nodejs
sudo apt-get install npm

######################################## Mongo Install ########################################

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo nano /etc/systemd/system/mongodb.service
----------------------------------------
[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target
----------------------------------------
sudo systemctl start mongodb
sudo systemctl status mongodb
sudo systemctl enable mongodb

######################################## Magento 1 Install ########################################

admin   1qwerty2
Magento User
user@magento.com
admin   1qwerty2

cd /var/www/magento_1/
git clone https://github.com/OpenMage/magento-mirror.git .
# download simple data and open arhive
tar -xvf magento-sample-data-1.9.2.4-2016-10-11-07-38-13.ta‌​r.gz
cp -R magento-sample-data-1.9.2.4-2016-10-11-07-38-13/* .
rm magento-sample-data-1.9.2.4-2016-10-11-07-38-13.ta‌​r.gz
rm -R magento-sample-data-1.9.2.4-2016-10-11-07-38-13
# ---
mysql -uadmin -p1qwerty2 magento_1 < magento_sample_data_for_1.9.2.4.sql
# ---
rm -R magento_sample_data_for_1.9.2.4.sql

#  1 Clean mail message
#  2 Admin / Security Section, -> Security -> Enable Form Key Validation On Checkout -> Yes [Save]
# checkout m2epro_magento_1)
# Скинуть весь кеш
ln ./misc/additional_scripts/upgrade_database.php ./updb.php
ln ./misc/additional_scripts/upgrade_upgrade.php ./up.php

# System → Configuration → Admin → Security → Session Lifetime                                      можно увиличить 36000

######################################## Magento 2 Install ########################################
cd /var/www
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento_2
cd magento_2/
chmod a+x bin/magento
bin/magento setup:install --base-url=http://magento-2.local --db-host=127.0.0.1 --db-name=magento_2 --db-user=admin --db-password=1qwerty2 --admin-firstname=Magento --admin-lastname=User --admin-email=user@magento.com --admin-user=admin --admin-password=1qwerty2 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1
#save path to admin
bin/magento sampledata:deploy
bin/magento setup:upgrade
bin/magento deploy:mode:set developer
# fix warning
bin/magento module:disable Shopial_Facebook
# fix warning from cron
bin/magento cron:run
# checkout m2epro_magento_2)

# Stores > Configuration > Advanced > Admin > Security > Admin Session Lifetime (seconds)           можно увиличить 36000

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

# Просмотр всех пользователей linux
cat /etc/passwd
sed 's/:.*//' /etc/passwd

# The End ;)