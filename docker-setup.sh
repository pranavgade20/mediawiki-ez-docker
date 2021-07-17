#!/bin/bash

# packages
apt-get update
apt-get install -y sudo vim supervisor wget apache2 mariadb-server php php-mysql libapache2-mod-php php-xml php-mbstring imagemagick php-curl git php-apcu php-intl

# setting up supervisord
mkdir -p /var/log/supervisor
cp /tmp/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# setting up mediawiki
wget https://releases.wikimedia.org/mediawiki/1.36/mediawiki-1.36.1.tar.gz
tar -xvzf mediawiki-*.tar.gz
sudo mkdir /var/lib/mediawiki
sudo mv mediawiki-*/* /var/lib/mediawiki
# https://www.mediawiki.org/wiki/Manual:Running_MediaWiki_on_Debian_or_Ubuntu#Introduction

# setting up apache
sudo ln -s /var/lib/mediawiki /var/www/html/mediawiki

# setting up mariadb
/usr/bin/mysqld_safe &
sleep 10
echo "CREATE USER 'wiki_user'@'localhost' IDENTIFIED BY 'super_safe_passwd'; CREATE DATABASE my_wiki; GRANT ALL ON my_wiki.* TO 'wiki_user'@'localhost';" > test.sql
mysql -u root mysql < test.sql
