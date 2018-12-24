#!/bin/bash
sudo apt-get install apache2 -y

sudo apt-get install software-properties-common -y

sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update -y

sudo apt-get install php7.2 libapache2-mod-php7.2 php7.2-common php7.2-mbstring php7.2-xmlrpc php7.2-soap php7.2-gd php7.2-xml php7.2-intl php7.2-mysql php7.2-cli php7.2-zip php7.2-curl -y

sudo systemctl start apache2
sudo systemctl enable apache2

wget https://releases.wikimedia.org/mediawiki/1.31/mediawiki-1.31.0.tar.gz
tar -xvzf mediawiki-1.31.0.tar.gz

sudo cp -r mediawiki-1.31.0 /var/www/html/mediawiki
sudo chown -R www-data:www-data /var/www/html/mediawiki
sudo chmod -R 777 /var/www/html/mediawiki

sudo a2ensite mediawiki.conf

sudo a2enmod rewrite

sudo systemctl restart apache2