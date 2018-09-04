#!/vin/bash

# MySQL
yum install mysql mysql-server myscl-devel
chkconfig --add mysqld
chkconfig mysql on
service mysql start
mysql -u root -e "SHOW DATABASES";


# Disable iptables
service iptables stop
chkconfig iptables off