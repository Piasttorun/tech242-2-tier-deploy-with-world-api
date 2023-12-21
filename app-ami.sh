#!/bin/bash

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
echo "done"
echo ""

# Reload Apache to apply changes
sudo systemctl reload apache2
echo "done"
echo ""