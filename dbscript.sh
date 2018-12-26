#!/bin/bash
sudo apt-get install mysql-server -y
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf 
sudo systemctl restart mysql.service
sudo ufw allow mysql

