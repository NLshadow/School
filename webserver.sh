#!/bin/bash
echo "Installing Apache2 and Apache2utils"
sleep 5 &

sudo apt-get install apache2 apache2-utils -y

sudo systemctl enable apache2
sudo systemctl start apache2

echo "Allowing HTTP traffic"
sudo ufw allow in "Apache"
sudo ufw status

echo "Installing mysql"
sudo apt-get install mysql-client mysql-server

echo "Installing php"
sudo apt-get install php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip 

sudo systemctl restart apache2

echo "Downloading Wordpress"
wget -c http://wordpress.org/latest.tar.gz /home/student/Downloads
tar -xvzf /home/student/Downloads/latest.tar.gz 
mv wordpress /var/www/

echo "Editing Premissions"
sudo chown -R www-data:www-data /var/www/wordpress
sudo chmod -R 755 /var/www/wordpress/

echo "Creating self-signed cert"
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/webserver.key -out /etc/ssl/certs/webserver.crt

wget https://raw.githubusercontent.com/NLshadow/School/main/wordpress.conf -P /etc/apache2/sites-available/
sleep 5&

echo "Change redirect address to correct dns name!"
vim /etc/apache2/sites-available/wrodpress.conf
sleep 5&

sudo a2enmod ssl
sleep 5&
sudo service apache2 restart
sleep 10&
sudo a2ensite wordpress.conf
sleep 10&
sudo service apache2 restart
