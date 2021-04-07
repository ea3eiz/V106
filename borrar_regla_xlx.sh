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
                        echo "                             BORRANDO REGLA Y PEER XLX                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""


sudo sed -i "120c #" /opt/HBlink3/rules.py
sudo sed -i "121c #" /opt/HBlink3/rules.py
sudo sed -i "122c #" /opt/HBlink3/rules.py
sudo sed -i "123c #" /opt/HBlink3/rules.py
sudo sed -i "124c #" /opt/HBlink3/rules.py

sudo sed -i "1020c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1021c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1022c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1023c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1024c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1025c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1026c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1027c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1028c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1029c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1030c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1031c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1032c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1033c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1034c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1035c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1036c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1037c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1038c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1039c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1040c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1041c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1042c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1043c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1044c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1045c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1046c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1047c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1048c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1049c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1050c # " /opt/HBlink3/hblink.cfg
sudo sed -i "1051c # " /opt/HBlink3/hblink.cfg

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
