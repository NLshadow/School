#!/bin/bash
echo "Installing Apache2 and Apache2utils"
sleep 5 &

sudo apt-get install apache2 apache2-utils -y

sudo systemctl enable apache2
sudo systemctl start apache2

echo "Allowing HTTP traffic"
sudo ufw allow in "Apache"
sudo ufw status
sleep 5 &

echo "Installing mysql"
sudo apt-get install mysql-client mysql-server -y

echo "Installing php"
sudo apt-get install php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y

sudo systemctl restart apache2

echo "Downloading Wordpress"
wget -c http://wordpress.org/latest.tar.gz 
tar -xvzf latest.tar.gz 
mv wordpress /var/www

echo "Editing Premissions"
sudo chown -R www-data:www-data /var/www/wordpress
sudo chmod -R 755 /var/www/wordpress/
