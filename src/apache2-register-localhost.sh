#!/usr/bin/env bash

sudo rm -R /var/www/html
sudo rm /etc/apache2/sites-available/000-default.conf

sudo mkdir -p /var/www/localhost
sudo touch /etc/apache2/sites-available/000-default.conf

sudo cat > /etc/apache2/sites-available/000-default.conf <<EOF
<Directory /var/www/localhost>
    Require all granted
</Directory>

<VirtualHost *:80>

    ServerAdmin m2e@localhost

    DocumentRoot /var/www/localhost

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    <Directory /var/www/localhost>
        Options Indexes FollowSymLinks
        AllowOverride All
    </Directory>

</VirtualHost>
EOF

sudo a2ensite 000-default.conf
sudo service apache2 reload
