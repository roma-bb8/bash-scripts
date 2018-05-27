#!/usr/bin/env bash

update magento 2 minore guid:
1.  php bin/magento maintenance:enable
2.  composer require magento/product-community-edition 2.2.4 --no-update
3.  composer update
4.  rm -rf var/cache/*
5.  rm -rf var/page_cache/*
6.  rm -rf generated
7.  php bin/magento setup:upgrade
8.  php bin/magento setup:di:compile
9.  php bin/magento cache:clean and
10. php bin/magento cache:flush command
11. bin/magento maintenance:disable







http://pubfiles.nexcess.net/magento/ce-packages/
Step 1 :
Login to your server via SSH!
Go to Magento root directory.

Step 2:
Take backup of your database and files.

Step 3:
Download the latest package in your magento root directory.
And Extract it

Reset the file permission:
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
find ./var -type d -exec chmod 777 {} \;
find ./pub/media -type d -exec chmod 777 {} \;
find ./pub/static -type d -exec chmod 777 {} \;
chmod 777 ./app/etc
chmod 644 ./app/etc/*.xml
chmod u+x bin/magento

Clear cache and run upgrade , deploy command:
php -f bin/magento cache:clean
php -f bin/magento cache:flush
php -f bin/magento setup:upgrade
php -f bin/magento setup:static-content:deploy

