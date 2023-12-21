#!/bin/bash

# update
echo "updating ..."
sudo apt update -y
echo "done"
echo ""

# upgrade
echo "upgrading..."
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "done"
echo ""

# install git
echo "installing git..."
sudo DEBIAN_FRONTEND=noninteractive apt install git -y
echo "done"
echo ""

# check git
echo "checking git..."
git --version
echo "done"
echo ""

# installing mysql
echo "installing mysql..."
sudo DEBIAN_FRONTEND=noninteractive apt install mysql-server -y
echo "done"
echo ""

# checking mysql
echo "checking mysql..."
mysql -V
echo "done"
echo ""

# git clone repo
echo "cloning repo..."
cd ~
git clone https://github.com/Piasttorun/worldProjectApiSQLSource repo
echo "done"
echo ""

# creating database
echo "creating database..."
sudo mysql -h localhost -P 3306 -u root -p"root" < repo/world.sql
echo "done"
echo ""

# change config file
echo "changing config file..."
if grep -q 'bind-address = 0.0.0.0' /etc/mysql/mysql.conf.d/mysqld.cnf; then
    echo "MySQL already configured."
else
    sudo sed -i 's/^bind-address.*$/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
fi
sudo systemctl restart mysql
echo "done"
echo ""

# create a user
echo "creating user..."
sudo mysql -u root -p"root" -e "CREATE USER 'ubuntu'@'%' IDENTIFIED BY 'PASSWORD';"
sudo mysql -u root -p"root" -e "GRANT ALL PRIVILEGES ON *.* TO 'ubuntu'@'%' WITH GRANT OPTION;"
sudo mysql -u root -p"root" -e "FLUSH PRIVILEGES;"
echo "done"
echo ""