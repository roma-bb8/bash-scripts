#!/usr/bin/env bash

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
