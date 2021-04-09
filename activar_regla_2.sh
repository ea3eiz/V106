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
                        echo "                           ACTIVANDO REGLA Y PEER 2                            "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""

sudo sed -i "222c ENABLED: True" /opt/HBlink3/hblink.cfg

line40=$(awk "NR==40" /opt/HBlink3/rules.py)
aline40=${line40:1:-1} #borra la primera letra de la variable
sleep 2
sudo sed -i "40c $aline40" /opt/HBlink3/rules.py

line41=$(awk "NR==41" /opt/HBlink3/rules.py)
aline41=${line41:1:-1} 
sleep 2
sudo sed -i "41c $aline41" /opt/HBlink3/rules.py

line42=$(awk "NR==42" /opt/HBlink3/rules.py)
aline42=${line42:1:-1}
sleep 2
sudo sed -i "42c $aline42" /opt/HBlink3/rules.py

line43=$(awk "NR==43" /opt/HBlink3/rules.py)
aline43=${line43:1:-1}
sleep 2
sudo sed -i "43c $aline43" /opt/HBlink3/rules.py

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
