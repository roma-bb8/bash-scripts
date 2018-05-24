#!/usr/bin/env bash

/usr/local/mysql/bin/mysql -um2e -p1qwerty2 <<MY_SQL_SCRIPT
DROP DATABASE IF EXISTS `magento_2`;
CREATE DATABASE IF NOT EXISTS `magento_2` CHARACTER SET UTF8 COLLATE utf8_general_ci;
MY_SQL_SCRIPT

sudo mkdir -p /var/www/magento_2

cd /var/www

sudo composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento_2

cd magento_2/

sudo chmod a+x bin/magento

bin/magento setup:install \
    --base-url=http://magento-2.local \
    --db-host=127.0.0.1 --db-name=magento_2 \
    --db-user=m2e \
    --db-password=1qwerty2 \
    --admin-firstname=Santa \
    --admin-lastname=Claus \
    --admin-email=santa@claus.org \
    --admin-user=m2e \
    --admin-password=1qwerty2 \
    --language=en_US \
    --currency=USD \
    --timezone=America/Chicago \
    --use-rewrites=1

bin/magento sampledata:deploy
bin/magento setup:upgrade
bin/magento deploy:mode:set developer
bin/magento setup:config:set --backend-frontname="admin"

bin/magento module:disable Shopial_Facebook

bin/magento cron:run

echo '#1 Checkout from svn m2epro_magento_2'
echo '#2 bin/magento module:enable Ess_M2ePro'
echo '#3 bin/magento setup:upgrade'

echo 'Crone'
echo 'crontab -e'
echo '* * * * * /var/www/magento_2/src/magento cron:run'
echo 'crontab -l';
echo 'OR';
echo "while true; do /var/www/magento_2/src/magento cron:run; echo -e  '\n----------------------------------------'; sleep 60; done;";
