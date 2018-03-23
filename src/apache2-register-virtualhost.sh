#!/usr/bin/env bash

# $1 = site_name
# $2 = site_dir
# $3 = site_ip_address

sudo echo "${3}     ${1}.local" >> /etc/hosts

sudo mkdir -p /var/www/${2}
sudo touch /etc/apache2/sites-available/${1}.local.conf

sudo cat > /etc/apache2/sites-available/${1}.local.conf <<EOF
<Directory /var/www/${2}>
    Require all granted
</Directory>

<VirtualHost *:80>

    ServerAdmin m2e@localhost

    ServerName ${1}.local
    ServerAlias www.${1}.local

    DocumentRoot /var/www/${2}

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    <Directory /var/www/${2}>
        Options Indexes FollowSymLinks
        AllowOverride All
    </Directory>

</VirtualHost>
EOF

sudo a2ensite ${1}.local.conf
sudo service apache2 reload
