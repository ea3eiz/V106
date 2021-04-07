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
                        echo "                             BORRANDO REGLA Y PEER 2                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""


sudo sed -i "40c #" /opt/HBlink3/rules.py
sudo sed -i "41c #" /opt/HBlink3/rules.py
sudo sed -i "42c #" /opt/HBlink3/rules.py
sudo sed -i "43c #" /opt/HBlink3/rules.py

sudo sed -i "220c # " /opt/HBlink3/hblink.cfg
sudo sed -i "221c # " /opt/HBlink3/hblink.cfg
sudo sed -i "222c # " /opt/HBlink3/hblink.cfg
sudo sed -i "223c # " /opt/HBlink3/hblink.cfg
sudo sed -i "224c # " /opt/HBlink3/hblink.cfg
sudo sed -i "225c # " /opt/HBlink3/hblink.cfg
sudo sed -i "226c # " /opt/HBlink3/hblink.cfg
sudo sed -i "227c # " /opt/HBlink3/hblink.cfg
sudo sed -i "228c # " /opt/HBlink3/hblink.cfg
sudo sed -i "229c # " /opt/HBlink3/hblink.cfg
sudo sed -i "230c # " /opt/HBlink3/hblink.cfg
sudo sed -i "231c # " /opt/HBlink3/hblink.cfg
sudo sed -i "232c # " /opt/HBlink3/hblink.cfg
sudo sed -i "233c # " /opt/HBlink3/hblink.cfg
sudo sed -i "234c # " /opt/HBlink3/hblink.cfg
sudo sed -i "235c # " /opt/HBlink3/hblink.cfg
sudo sed -i "236c # " /opt/HBlink3/hblink.cfg
sudo sed -i "237c # " /opt/HBlink3/hblink.cfg
sudo sed -i "238c # " /opt/HBlink3/hblink.cfg
sudo sed -i "239c # " /opt/HBlink3/hblink.cfg
sudo sed -i "240c # " /opt/HBlink3/hblink.cfg
sudo sed -i "241c # " /opt/HBlink3/hblink.cfg
sudo sed -i "242c # " /opt/HBlink3/hblink.cfg
sudo sed -i "243c # " /opt/HBlink3/hblink.cfg
sudo sed -i "244c # " /opt/HBlink3/hblink.cfg
sudo sed -i "245c # " /opt/HBlink3/hblink.cfg
sudo sed -i "246c # " /opt/HBlink3/hblink.cfg
sudo sed -i "247c # " /opt/HBlink3/hblink.cfg
sudo sed -i "248c # " /opt/HBlink3/hblink.cfg
sudo sed -i "249c # " /opt/HBlink3/hblink.cfg
sudo sed -i "250c # " /opt/HBlink3/hblink.cfg
sudo sed -i "251c # " /opt/HBlink3/hblink.cfg

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
