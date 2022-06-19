#!/bin/bash
echo "Installing Apache2 and Apache2utils"
sleep 5 &

sudo apt-get install apache2 apache2-utils -y

sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2

echo "Press enter to continue"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
else
echo "Waiting for keypress"
fi
done

echo "Allowing HTTP traffic"
sudo ufw allow in "Apache"
sudo ufw status
sleep 5 &

echo "Installing mysql"
sudo apt-get install mysql-client mysql-server

echo "Installing php"
sudo apt-get install php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip 

sudo systemctl restart apache2

echo "Downloading Wordpress"
wget -c http://wordpress.org/latest.tar.gz /home/student/Downloads
tar -xvzf /home/student/Downloads/latest.tar.gz /var/www/wordpress

echo "Editing Premissions"
sudo chown -R www-data:www-data /var/www/wordpress
sudo chmod -R 755 /var/www/wordpress/
