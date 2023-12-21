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

# install maven
echo "installing maven..."
sudo DEBIAN_FRONTEND=noninteractive apt install maven -y
echo "done"
echo ""

# check maven
echo "checking maven..."
mvn -version
echo "done"
echo ""

# install JDK java 17
echo "installing java 17..."
sudo DEBIAN_FRONTEND=noninteractive apt install openjdk-17-jdk -y
echo "done"
echo ""

# check JDK 17
echo "checking java 17..."
java -version
javac -version
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

# installing Apache
echo "installing apache2..."
sudo DEBIAN_FRONTEND=noninteractive apt install apache2 -y
echo "done"
echo ""

# checking apache2
echo "checkign apache2"
apache2 -ver
echo "done"
echo ""

# git clone repo
echo "cloning repo..."
cd ~
git clone https://github.com/Piasttorun/WorldProjectAWS-API repo
echo "done"
echo ""

# checkign mysql connection
echo "checking MySQL connection..."
if mysql -h 54.194.140.186 -u"ubuntu" -p"PASSWORD" -e"world"; &> /dev/null; then
    echo "MySQL database is linked."
else
    echo "Error: Unable to connect to the MySQL database."
    exit 0
fi
echo "done"
echo ""

# set env vars
echo "setting env vars..."
export DB_HOST=jdbc:mysql://34.240.230.46:3306/world
export DB_USER=ubuntu
export DB_PASS=PASSWORD
echo "done"
echo ""

# run
echo "running..."
cd ~/repo/WorldProject/
mvn clean package spring-boot:start
mvn clean package spring-boot:start
echo "done"
echo ""

# Enable necessary Apache modules
sudo a2enmod proxy
sudo a2enmod proxy_http

if grep -q 'ProxyPreserveHost On' /etc/apache2/sites-available/000-default.conf; then
    echo "Reverse proxy already configured."
else
    sudo sed -i '/DocumentRoot \/var\/www\/html/ a\ProxyPreserveHost On\nProxyPass \/ http:\/\/localhost:5000\/\nProxyPassReverse \/ http:\/\/localhost:5000\/\n' /etc/apache2/sites-available/000-default.conf
fi

# Enable the virtual host
sudo a2ensite reverse-proxy

# Reload Apache to apply changes
sudo systemctl reload apache2
echo "done"
echo ""
```