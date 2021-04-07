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
                        echo "                             BORRANDO REGLA Y PEER 3                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""


sudo sed -i "50c #" /opt/HBlink3/rules.py
sudo sed -i "51c #" /opt/HBlink3/rules.py
sudo sed -i "52c #" /opt/HBlink3/rules.py
sudo sed -i "53c #" /opt/HBlink3/rules.py

sudo sed -i "320c # " /opt/HBlink3/hblink.cfg
sudo sed -i "321c # " /opt/HBlink3/hblink.cfg
sudo sed -i "322c # " /opt/HBlink3/hblink.cfg
sudo sed -i "323c # " /opt/HBlink3/hblink.cfg
sudo sed -i "324c # " /opt/HBlink3/hblink.cfg
sudo sed -i "325c # " /opt/HBlink3/hblink.cfg
sudo sed -i "326c # " /opt/HBlink3/hblink.cfg
sudo sed -i "327c # " /opt/HBlink3/hblink.cfg
sudo sed -i "328c # " /opt/HBlink3/hblink.cfg
sudo sed -i "329c # " /opt/HBlink3/hblink.cfg
sudo sed -i "330c # " /opt/HBlink3/hblink.cfg
sudo sed -i "331c # " /opt/HBlink3/hblink.cfg
sudo sed -i "332c # " /opt/HBlink3/hblink.cfg
sudo sed -i "333c # " /opt/HBlink3/hblink.cfg
sudo sed -i "334c # " /opt/HBlink3/hblink.cfg
sudo sed -i "335c # " /opt/HBlink3/hblink.cfg
sudo sed -i "336c # " /opt/HBlink3/hblink.cfg
sudo sed -i "337c # " /opt/HBlink3/hblink.cfg
sudo sed -i "338c # " /opt/HBlink3/hblink.cfg
sudo sed -i "339c # " /opt/HBlink3/hblink.cfg
sudo sed -i "340c # " /opt/HBlink3/hblink.cfg
sudo sed -i "341c # " /opt/HBlink3/hblink.cfg
sudo sed -i "342c # " /opt/HBlink3/hblink.cfg
sudo sed -i "343c # " /opt/HBlink3/hblink.cfg
sudo sed -i "344c # " /opt/HBlink3/hblink.cfg
sudo sed -i "345c # " /opt/HBlink3/hblink.cfg
sudo sed -i "346c # " /opt/HBlink3/hblink.cfg
sudo sed -i "347c # " /opt/HBlink3/hblink.cfg
sudo sed -i "348c # " /opt/HBlink3/hblink.cfg
sudo sed -i "349c # " /opt/HBlink3/hblink.cfg
sudo sed -i "350c # " /opt/HBlink3/hblink.cfg
sudo sed -i "351c # " /opt/HBlink3/hblink.cfg

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
