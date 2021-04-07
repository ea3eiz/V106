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
                        echo "                             BORRANDO REGLA Y PEER 7                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""


sudo sed -i "90c #" /opt/HBlink3/rules.py
sudo sed -i "91c #" /opt/HBlink3/rules.py
sudo sed -i "92c #" /opt/HBlink3/rules.py
sudo sed -i "93c #" /opt/HBlink3/rules.py

sudo sed -i "720c # " /opt/HBlink3/hblink.cfg
sudo sed -i "721c # " /opt/HBlink3/hblink.cfg
sudo sed -i "722c # " /opt/HBlink3/hblink.cfg
sudo sed -i "723c # " /opt/HBlink3/hblink.cfg
sudo sed -i "724c # " /opt/HBlink3/hblink.cfg
sudo sed -i "725c # " /opt/HBlink3/hblink.cfg
sudo sed -i "726c # " /opt/HBlink3/hblink.cfg
sudo sed -i "727c # " /opt/HBlink3/hblink.cfg
sudo sed -i "728c # " /opt/HBlink3/hblink.cfg
sudo sed -i "729c # " /opt/HBlink3/hblink.cfg
sudo sed -i "730c # " /opt/HBlink3/hblink.cfg
sudo sed -i "731c # " /opt/HBlink3/hblink.cfg
sudo sed -i "732c # " /opt/HBlink3/hblink.cfg
sudo sed -i "733c # " /opt/HBlink3/hblink.cfg
sudo sed -i "734c # " /opt/HBlink3/hblink.cfg
sudo sed -i "735c # " /opt/HBlink3/hblink.cfg
sudo sed -i "736c # " /opt/HBlink3/hblink.cfg
sudo sed -i "737c # " /opt/HBlink3/hblink.cfg
sudo sed -i "738c # " /opt/HBlink3/hblink.cfg
sudo sed -i "739c # " /opt/HBlink3/hblink.cfg
sudo sed -i "740c # " /opt/HBlink3/hblink.cfg
sudo sed -i "741c # " /opt/HBlink3/hblink.cfg
sudo sed -i "742c # " /opt/HBlink3/hblink.cfg
sudo sed -i "743c # " /opt/HBlink3/hblink.cfg
sudo sed -i "744c # " /opt/HBlink3/hblink.cfg
sudo sed -i "745c # " /opt/HBlink3/hblink.cfg
sudo sed -i "746c # " /opt/HBlink3/hblink.cfg
sudo sed -i "747c # " /opt/HBlink3/hblink.cfg
sudo sed -i "748c # " /opt/HBlink3/hblink.cfg
sudo sed -i "749c # " /opt/HBlink3/hblink.cfg
sudo sed -i "750c # " /opt/HBlink3/hblink.cfg
sudo sed -i "751c # " /opt/HBlink3/hblink.cfg

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
