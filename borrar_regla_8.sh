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
                        echo "                             BORRANDO REGLA Y PEER 8                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""


sudo sed -i "100c #" /opt/HBlink3/rules.py
sudo sed -i "101c #" /opt/HBlink3/rules.py
sudo sed -i "102c #" /opt/HBlink3/rules.py
sudo sed -i "103c #" /opt/HBlink3/rules.py

sudo sed -i "820c # " /opt/HBlink3/hblink.cfg
sudo sed -i "821c # " /opt/HBlink3/hblink.cfg
sudo sed -i "822c # " /opt/HBlink3/hblink.cfg
sudo sed -i "823c # " /opt/HBlink3/hblink.cfg
sudo sed -i "824c # " /opt/HBlink3/hblink.cfg
sudo sed -i "825c # " /opt/HBlink3/hblink.cfg
sudo sed -i "826c # " /opt/HBlink3/hblink.cfg
sudo sed -i "827c # " /opt/HBlink3/hblink.cfg
sudo sed -i "828c # " /opt/HBlink3/hblink.cfg
sudo sed -i "829c # " /opt/HBlink3/hblink.cfg
sudo sed -i "830c # " /opt/HBlink3/hblink.cfg
sudo sed -i "831c # " /opt/HBlink3/hblink.cfg
sudo sed -i "832c # " /opt/HBlink3/hblink.cfg
sudo sed -i "833c # " /opt/HBlink3/hblink.cfg
sudo sed -i "834c # " /opt/HBlink3/hblink.cfg
sudo sed -i "835c # " /opt/HBlink3/hblink.cfg
sudo sed -i "836c # " /opt/HBlink3/hblink.cfg
sudo sed -i "837c # " /opt/HBlink3/hblink.cfg
sudo sed -i "838c # " /opt/HBlink3/hblink.cfg
sudo sed -i "839c # " /opt/HBlink3/hblink.cfg
sudo sed -i "840c # " /opt/HBlink3/hblink.cfg
sudo sed -i "841c # " /opt/HBlink3/hblink.cfg
sudo sed -i "842c # " /opt/HBlink3/hblink.cfg
sudo sed -i "843c # " /opt/HBlink3/hblink.cfg
sudo sed -i "844c # " /opt/HBlink3/hblink.cfg
sudo sed -i "845c # " /opt/HBlink3/hblink.cfg
sudo sed -i "846c # " /opt/HBlink3/hblink.cfg
sudo sed -i "847c # " /opt/HBlink3/hblink.cfg
sudo sed -i "848c # " /opt/HBlink3/hblink.cfg
sudo sed -i "849c # " /opt/HBlink3/hblink.cfg
sudo sed -i "850c # " /opt/HBlink3/hblink.cfg
sudo sed -i "851c # " /opt/HBlink3/hblink.cfg

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
