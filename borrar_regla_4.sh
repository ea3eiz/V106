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
                        echo "                             BORRANDO REGLA Y PEER 4                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""


sudo sed -i "60c #" /opt/HBlink3/rules.py
sudo sed -i "61c #" /opt/HBlink3/rules.py
sudo sed -i "62c #" /opt/HBlink3/rules.py
sudo sed -i "63c #" /opt/HBlink3/rules.py

sudo sed -i "420c # " /opt/HBlink3/hblink.cfg
sudo sed -i "421c # " /opt/HBlink3/hblink.cfg
sudo sed -i "422c # " /opt/HBlink3/hblink.cfg
sudo sed -i "423c # " /opt/HBlink3/hblink.cfg
sudo sed -i "424c # " /opt/HBlink3/hblink.cfg
sudo sed -i "425c # " /opt/HBlink3/hblink.cfg
sudo sed -i "426c # " /opt/HBlink3/hblink.cfg
sudo sed -i "427c # " /opt/HBlink3/hblink.cfg
sudo sed -i "428c # " /opt/HBlink3/hblink.cfg
sudo sed -i "429c # " /opt/HBlink3/hblink.cfg
sudo sed -i "430c # " /opt/HBlink3/hblink.cfg
sudo sed -i "431c # " /opt/HBlink3/hblink.cfg
sudo sed -i "432c # " /opt/HBlink3/hblink.cfg
sudo sed -i "433c # " /opt/HBlink3/hblink.cfg
sudo sed -i "434c # " /opt/HBlink3/hblink.cfg
sudo sed -i "435c # " /opt/HBlink3/hblink.cfg
sudo sed -i "436c # " /opt/HBlink3/hblink.cfg
sudo sed -i "437c # " /opt/HBlink3/hblink.cfg
sudo sed -i "438c # " /opt/HBlink3/hblink.cfg
sudo sed -i "439c # " /opt/HBlink3/hblink.cfg
sudo sed -i "440c # " /opt/HBlink3/hblink.cfg
sudo sed -i "441c # " /opt/HBlink3/hblink.cfg
sudo sed -i "442c # " /opt/HBlink3/hblink.cfg
sudo sed -i "443c # " /opt/HBlink3/hblink.cfg
sudo sed -i "444c # " /opt/HBlink3/hblink.cfg
sudo sed -i "445c # " /opt/HBlink3/hblink.cfg
sudo sed -i "446c # " /opt/HBlink3/hblink.cfg
sudo sed -i "447c # " /opt/HBlink3/hblink.cfg
sudo sed -i "448c # " /opt/HBlink3/hblink.cfg
sudo sed -i "449c # " /opt/HBlink3/hblink.cfg
sudo sed -i "450c # " /opt/HBlink3/hblink.cfg
sudo sed -i "451c # " /opt/HBlink3/hblink.cfg

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
