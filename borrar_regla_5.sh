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
                        echo "                             BORRANDO REGLA Y PEER 5                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""


sudo sed -i "70c #" /opt/HBlink3/rules.py
sudo sed -i "71c #" /opt/HBlink3/rules.py
sudo sed -i "72c #" /opt/HBlink3/rules.py
sudo sed -i "73c #" /opt/HBlink3/rules.py

sudo sed -i "520c # " /opt/HBlink3/hblink.cfg
sudo sed -i "521c # " /opt/HBlink3/hblink.cfg
sudo sed -i "522c # " /opt/HBlink3/hblink.cfg
sudo sed -i "523c # " /opt/HBlink3/hblink.cfg
sudo sed -i "524c # " /opt/HBlink3/hblink.cfg
sudo sed -i "525c # " /opt/HBlink3/hblink.cfg
sudo sed -i "526c # " /opt/HBlink3/hblink.cfg
sudo sed -i "527c # " /opt/HBlink3/hblink.cfg
sudo sed -i "528c # " /opt/HBlink3/hblink.cfg
sudo sed -i "529c # " /opt/HBlink3/hblink.cfg
sudo sed -i "530c # " /opt/HBlink3/hblink.cfg
sudo sed -i "531c # " /opt/HBlink3/hblink.cfg
sudo sed -i "532c # " /opt/HBlink3/hblink.cfg
sudo sed -i "533c # " /opt/HBlink3/hblink.cfg
sudo sed -i "534c # " /opt/HBlink3/hblink.cfg
sudo sed -i "535c # " /opt/HBlink3/hblink.cfg
sudo sed -i "536c # " /opt/HBlink3/hblink.cfg
sudo sed -i "537c # " /opt/HBlink3/hblink.cfg
sudo sed -i "538c # " /opt/HBlink3/hblink.cfg
sudo sed -i "539c # " /opt/HBlink3/hblink.cfg
sudo sed -i "540c # " /opt/HBlink3/hblink.cfg
sudo sed -i "541c # " /opt/HBlink3/hblink.cfg
sudo sed -i "542c # " /opt/HBlink3/hblink.cfg
sudo sed -i "543c # " /opt/HBlink3/hblink.cfg
sudo sed -i "544c # " /opt/HBlink3/hblink.cfg
sudo sed -i "545c # " /opt/HBlink3/hblink.cfg
sudo sed -i "546c # " /opt/HBlink3/hblink.cfg
sudo sed -i "547c # " /opt/HBlink3/hblink.cfg
sudo sed -i "548c # " /opt/HBlink3/hblink.cfg
sudo sed -i "549c # " /opt/HBlink3/hblink.cfg
sudo sed -i "550c # " /opt/HBlink3/hblink.cfg
sudo sed -i "551c # " /opt/HBlink3/hblink.cfg

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
