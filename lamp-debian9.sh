#!/bin/bash
echo " "
jeshile='\e[40;38;5;82m'
jo='\e[0m'
os=$(exec uname -m|grep 64)
if [ "$os" = "" ]
then os="x86"
else os="x64"
fi

DIRE=$(hostname -I)
DIREMODE=$(expr "$DIRE" : '\(.*\).')


echo -e "${jeshile} +-----------------------------+ \e[0m"
echo -e "${jeshile} ¦Revisando Version del sistema¦ \e[0m"
echo -e "${jeshile} +-----------------------------+ \e[0m"
sleep 3
echo -e "${jeshile} +------------------------------+ \e[0m"
echo -e "${jeshile} ¦Sistema de $os Bits Detecatado¦ \e[0m"
echo -e "${jeshile} +------------------------------+ \e[0m"
sleep 3
echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦       Prerequisitos       ¦ \e[0m"
echo -e "${jeshile} ¦                           ¦ \e[0m"
echo -e "${jeshile} ¦ Contraseña de PhpMyadmin  ¦ \e[0m"
echo -e "${jeshile} ¦ Contraseña de MySql       ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
echo " "
sleep 5

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Escribe la contraseña    ¦ \e[0m"
echo -e "${jeshile} ¦     de PhpMyadmin         ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
echo " "
sleep 3

read CONTRAPHP
echo "Tu Contraseña de PhpMyadmin es: $CONTRAPHP"

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Escribe la contraseña    ¦ \e[0m"
echo -e "${jeshile} ¦        de MYSQL           ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
echo " "
sleep 3

read CONTRAMYSQL
echo "Tu Contraseña de PhpMyadmin es: $CONTRAMYSQL"


echo -e "${jeshile} +-------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦  Eliminando fuentes del cd rom            ¦ \e[0m"
echo -e "${jeshile} +-------------------------------------------+ \e[0m"
sleep 3

sed -i 's/deb cdrom/# deb cdrom/g' /etc/apt/sources.list


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Actulizando el sisteama  ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

apt update -y


echo -e "${jeshile} +-------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦    Descargando configuracion de mysql     ¦ \e[0m"
echo -e "${jeshile} +-------------------------------------------+ \e[0m"
sleep 3

wget "http://xtreme.dynns.com:5000/apk/xtream/mysql-apt-config_0.8.15-1_all.deb"


echo -e "${jeshile} +-------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦  Seleccionando version de servidor mysql  ¦ \e[0m"
echo -e "${jeshile} +-------------------------------------------+ \e[0m"
sleep 3

dpkg -i mysql-apt-config_0.8.15-1_all.deb
rm mysql-apt-config_0.8.15-1_all.deb


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Actulizando el sisteama  ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

apt update -y


echo -e "${jeshile} +----------------------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦              Instalando MySql Seerver                    ¦ \e[0m"
echo -e "${jeshile} ¦          Tu contraseña de Mysql es $CONTRAMYSQL          ¦ \e[0m"
echo -e "${jeshile} +----------------------------------------------------------+ \e[0m"
sleep 3

apt install mysql-community-server -y


echo " "
echo -e "${jeshile} +-------------------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦    Configurando seguridad MYSQL                       ¦ \e[0m"
echo -e "${jeshile} ¦    Tu contraseña de Mysql es $CONTRAMYSQL             ¦ \e[0m"
echo -e "${jeshile} ¦                                                       ¦ \e[0m"
echo -e "${jeshile} ¦  *****  Las primeras 2 opciones le dices N  *****     ¦ \e[0m"
echo -e "${jeshile} ¦                                                       ¦ \e[0m"
echo -e "${jeshile} ¦VALIDATE PASSWORD PLUGIN                   presiona n  ¦ \e[0m"
echo -e "${jeshile} ¦Change the password for root ?             presiona n  ¦ \e[0m"
echo -e "${jeshile} ¦                                                       ¦ \e[0m"
echo -e "${jeshile} ¦  *****  Las siguientes 4 opciones le dices Y  *****   ¦ \e[0m"
echo -e "${jeshile} ¦                                                       ¦ \e[0m"
echo -e "${jeshile} ¦Remove anonymous users?                    presiona y  ¦ \e[0m"
echo -e "${jeshile} ¦Disallow root login remotely?              presiona y  ¦ \e[0m"
echo -e "${jeshile} ¦Remove test database and access to it?     presiona y  ¦ \e[0m"
echo -e "${jeshile} ¦Reload privilege tables now?               presiona y  ¦ \e[0m"
echo -e "${jeshile} ¦                                                       ¦ \e[0m"  
echo -e "${jeshile} ¦                                                       ¦ \e[0m"
echo -e "${jeshile} +-------------------------------------------------------+ \e[0m"
sleep 3

mysql_secure_installation


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Repositorios de php 7.3  ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

apt -y install lsb-release apt-transport-https ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.3.list


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Actulizando el sisteama  ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

apt update -y

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Instalando PHP 7.3       ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

apt -y install php7.3


echo -e "${jeshile} +-------------------------------+ \e[0m"
echo -e "${jeshile} ¦  Instalando Modulos php 7.3   ¦ \e[0m"
echo -e "${jeshile} +-------------------------------+ \e[0m"
sleep 3

apt -y install php7.3-cli php7.3-fpm php7.3-json php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd  php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath php7.3-json


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Agreando PHP al Inicio   ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

sed -i 's/DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm/DirectoryIndex index.php index.cgi index.pl index.html index.xhtml index.htm/g' /etc/apache2/mods-enabled/dir.conf


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦    Reiniciando Apache     ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

systemctl restart apache2


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦ Actualizando Repositorios ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

apt update


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦   Instalando PhpMyadmin   ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

apt install phpmyadmin -y


echo -e "${jeshile} +------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦   Resolviendo error 613 de  PhpMyadmin   ¦ \e[0m"
echo -e "${jeshile} +------------------------------------------+ \e[0m"
sleep 3

sed -i 's/] == 1)/]) == 1/g' /usr/share/phpmyadmin/libraries/sql.lib.php


echo -e "${jeshile} +------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦   Resolviendo error 551 de  PhpMyadmin   ¦ \e[0m"
echo -e "${jeshile} +------------------------------------------+ \e[0m"
sleep 3

sed -i 's/count($options)/count((array)$options)/g' /usr/share/phpmyadmin/libraries/plugin_interface.lib.php


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦    Reiniciando Apache     ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

systemctl restart apache2


echo " "
echo -e "${jeshile} +---------------------------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦                                                               ¦ \e[0m"
echo -e "${jeshile} ¦               Configurando Usuario de MYSQL                   ¦ \e[0m"
echo -e "${jeshile} ¦                                                               ¦ \e[0m"
echo -e "${jeshile} +---------------------------------------------------------------+ \e[0m"
sleep 3

mysql --user=root --password=$CONTRAMYSQL -e "CREATE USER admin@localhost IDENTIFIED BY '$CONTRAPHP';"
mysql --user=root --password=$CONTRAMYSQL -e "GRANT ALL PRIVILEGES ON *.* TO admin@localhost WITH GRANT OPTION;"
mysql --user=root --password=$CONTRAMYSQL -e "FLUSH PRIVILEGES;"


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦   Instalando libcurl13    ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

apt install libcurl3 -y


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Actulizando el sisteama  ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

apt update -y


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦   Instalando libpng12     ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

apt install libpng12-0


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦     Instalando sudo       ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

apt install sudo

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦    Instalando libssl1     ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u12_amd64.deb
dpkg -i libssl1.0.0_1.0.1t-1+deb8u12_amd64.deb 



echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦   Instalando Python       ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

apt install python -y
apt install python-paramiko -y
wget https://xtream-ui.com/install/install.py



echo " "
echo -e "${jeshile} +-----------------------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦      Creditos y soporte melcocha14@gmail.com             ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Tus Datos de Acceso son:                            ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Datos acceso de PhpMyadmin                          ¦ \e[0m"
echo -e "${jeshile} ¦      Usuario: 	admin                                  ¦ \e[0m"
echo -e "${jeshile} ¦      Contraseña: 	$CONTRAPHP                             ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Link de acceso Phpmyadmin                           ¦ \e[0m"
echo -e "${jeshile} ¦      http://$DIREMODE/phpmyadmin                         ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Datos de acceso Mysql                               ¦ \e[0m"
echo -e "${jeshile} ¦      Usuario: 	root                                   ¦ \e[0m"
echo -e "${jeshile} ¦      Contraseña: 	$CONTRAPHP                             ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Guarda tus Datos en un lugar seguro                 ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Escribe el siguiente comando y escribe MAIN         ¦ \e[0m"
echo -e "${jeshile} ¦      python install.py                                   ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} +-----------------------------------------------------------+ \e[0m"
echo " "
sleep 3
