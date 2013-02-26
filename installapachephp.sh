#!/bin/bash
#be up to date
sudo apt-get update
sudo apt-get upgrade

#Apache:
#Infos: http://wiki.ubuntuusers.de/Apache
#Install: 
sudo apt-get install apache2 apache2-doc
#Test: localhost

#PHP
#Info: http://wiki.ubuntuusers.de/PHP
#Install: 
sudo apt-get install php5 
#Testen:
#cd /var/www
#sudo gedit phpinfo.php
#einfügen und speichern: <?php phpinfo();?>
#Testen: localhost/phpinfo.php

