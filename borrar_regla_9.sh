#!/bin/bash
clear
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

                        echo "\v\v\v\v\v\v"
                        echo "${VERDE}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                             BORRANDO REGLA Y PEER 9                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""


sudo sed -i "110c #" /opt/HBlink3/rules.py
sudo sed -i "111c #" /opt/HBlink3/rules.py
sudo sed -i "112c #" /opt/HBlink3/rules.py
sudo sed -i "113c #" /opt/HBlink3/rules.py

sudo sed -i "920c # " /opt/HBlink3/hblink.cfg
sudo sed -i "921c # " /opt/HBlink3/hblink.cfg
sudo sed -i "922c # " /opt/HBlink3/hblink.cfg
sudo sed -i "923c # " /opt/HBlink3/hblink.cfg
sudo sed -i "924c # " /opt/HBlink3/hblink.cfg
sudo sed -i "925c # " /opt/HBlink3/hblink.cfg
sudo sed -i "926c # " /opt/HBlink3/hblink.cfg
sudo sed -i "927c # " /opt/HBlink3/hblink.cfg
sudo sed -i "928c # " /opt/HBlink3/hblink.cfg
sudo sed -i "929c # " /opt/HBlink3/hblink.cfg
sudo sed -i "930c # " /opt/HBlink3/hblink.cfg
sudo sed -i "931c # " /opt/HBlink3/hblink.cfg
sudo sed -i "932c # " /opt/HBlink3/hblink.cfg
sudo sed -i "933c # " /opt/HBlink3/hblink.cfg
sudo sed -i "934c # " /opt/HBlink3/hblink.cfg
sudo sed -i "935c # " /opt/HBlink3/hblink.cfg
sudo sed -i "936c # " /opt/HBlink3/hblink.cfg
sudo sed -i "937c # " /opt/HBlink3/hblink.cfg
sudo sed -i "938c # " /opt/HBlink3/hblink.cfg
sudo sed -i "939c # " /opt/HBlink3/hblink.cfg
sudo sed -i "940c # " /opt/HBlink3/hblink.cfg
sudo sed -i "941c # " /opt/HBlink3/hblink.cfg
sudo sed -i "942c # " /opt/HBlink3/hblink.cfg
sudo sed -i "943c # " /opt/HBlink3/hblink.cfg
sudo sed -i "944c # " /opt/HBlink3/hblink.cfg
sudo sed -i "945c # " /opt/HBlink3/hblink.cfg
sudo sed -i "946c # " /opt/HBlink3/hblink.cfg
sudo sed -i "947c # " /opt/HBlink3/hblink.cfg
sudo sed -i "948c # " /opt/HBlink3/hblink.cfg
sudo sed -i "949c # " /opt/HBlink3/hblink.cfg
sudo sed -i "950c # " /opt/HBlink3/hblink.cfg
sudo sed -i "951c # " /opt/HBlink3/hblink.cfg

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
