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
                        echo "                             BORRANDO REGLA Y PEER 6                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""


sudo sed -i "80c #" /opt/HBlink3/rules.py
sudo sed -i "81c #" /opt/HBlink3/rules.py
sudo sed -i "82c #" /opt/HBlink3/rules.py
sudo sed -i "83c #" /opt/HBlink3/rules.py

sudo sed -i "620c # " /opt/HBlink3/hblink.cfg
sudo sed -i "621c # " /opt/HBlink3/hblink.cfg
sudo sed -i "622c # " /opt/HBlink3/hblink.cfg
sudo sed -i "623c # " /opt/HBlink3/hblink.cfg
sudo sed -i "624c # " /opt/HBlink3/hblink.cfg
sudo sed -i "625c # " /opt/HBlink3/hblink.cfg
sudo sed -i "626c # " /opt/HBlink3/hblink.cfg
sudo sed -i "627c # " /opt/HBlink3/hblink.cfg
sudo sed -i "628c # " /opt/HBlink3/hblink.cfg
sudo sed -i "629c # " /opt/HBlink3/hblink.cfg
sudo sed -i "630c # " /opt/HBlink3/hblink.cfg
sudo sed -i "631c # " /opt/HBlink3/hblink.cfg
sudo sed -i "632c # " /opt/HBlink3/hblink.cfg
sudo sed -i "633c # " /opt/HBlink3/hblink.cfg
sudo sed -i "634c # " /opt/HBlink3/hblink.cfg
sudo sed -i "635c # " /opt/HBlink3/hblink.cfg
sudo sed -i "636c # " /opt/HBlink3/hblink.cfg
sudo sed -i "637c # " /opt/HBlink3/hblink.cfg
sudo sed -i "638c # " /opt/HBlink3/hblink.cfg
sudo sed -i "639c # " /opt/HBlink3/hblink.cfg
sudo sed -i "640c # " /opt/HBlink3/hblink.cfg
sudo sed -i "641c # " /opt/HBlink3/hblink.cfg
sudo sed -i "642c # " /opt/HBlink3/hblink.cfg
sudo sed -i "643c # " /opt/HBlink3/hblink.cfg
sudo sed -i "644c # " /opt/HBlink3/hblink.cfg
sudo sed -i "645c # " /opt/HBlink3/hblink.cfg
sudo sed -i "646c # " /opt/HBlink3/hblink.cfg
sudo sed -i "647c # " /opt/HBlink3/hblink.cfg
sudo sed -i "648c # " /opt/HBlink3/hblink.cfg
sudo sed -i "649c # " /opt/HBlink3/hblink.cfg
sudo sed -i "650c # " /opt/HBlink3/hblink.cfg
sudo sed -i "651c # " /opt/HBlink3/hblink.cfg

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
