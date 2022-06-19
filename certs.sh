echo "Creating self-signed cert"
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/webserver.key -out /etc/ssl/certs/webserver.crt

wget https://raw.githubusercontent.com/NLshadow/School/main/wordpress.conf -P /etc/apache2/sites-available/

echo "Change redirect address to correct dns name!"
sleep 5&

sudo a2ensite wordpress.conf
sleep 10&
sudo service apache2 restart
