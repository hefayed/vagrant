#!/bin/bash

# Apache
yum update -y --exclude=kernel
yum install - y nano git unzip screen
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop
rm -rf /var/www/html
ln -s /vagrant /var/www/html
service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# MySQL

yum install mysql mysql-server myscl-devel
chkconfig --add mysqld
chkconfig mysql on
service mysql start
mysql -u root -e "SHOW DATABASES";

# Download Started Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/hefayed01/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/hefayed01/vagrant/master/files/info.php
service httpd restart

# Disable iptables
service iptables stop
chkconfig iptables off