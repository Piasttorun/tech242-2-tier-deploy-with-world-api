# tech242-2-tier-deploy-with-world-api

sudo DEBIAN_FRONTEND=noninteractive apt-get install mysql-shell -y

sudo DEBIAN_FRONTEND=noninteractive apt install mysql-server -y

sudo systemctl start mysql.service

sudo DEBIAN_FRONTEND=noninteractive apt install maven -y

sudo DEBIAN_FRONTEND=noninteractive apt install mysql-server -y

sudo systemctl status mysql.service

```
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
sudo systemctl status mysql.service
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
sudo mysql -h localhost -P 3306 -u root -p < repo/world.sql
echo "done"
echo ""


```
