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

                        echo "\v\v\v"
                        echo "${VERDE}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                           DESACTIVANDO REGLA Y PEER 2                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5

# 0 = La Regla NO está creada
# 1 = La Regla SI está creada
# 2 = La Regla está ACTIVADA
# 3 = La Regla está DESACTIVADO

estado=$(awk "NR==22" /home/pi/info.ini)

if [ $estado = 2 ]
then

sudo sed -i "222c ENABLED: False" /opt/HBlink3/hblink.cfg

line40=$(awk "NR==40" /opt/HBlink3/rules.py)
sudo sed -i "40c #$line40" /opt/HBlink3/rules.py

line41=$(awk "NR==41" /opt/HBlink3/rules.py)
sudo sed -i "41c #$line41" /opt/HBlink3/rules.py

line42=$(awk "NR==42" /opt/HBlink3/rules.py)
sudo sed -i "42c #$line42" /opt/HBlink3/rules.py

line43=$(awk "NR==43" /opt/HBlink3/rules.py)
sudo sed -i "43c #$line43" /opt/HBlink3/rules.py

sudo systemctl restart hbmon
sudo systemctl restart hblink

sudo sed -i "22c 3" /home/pi/info.ini
                        
                        clear
                        echo "\v\v\v"
                        echo "${AMARILLO}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                    LA REGLA SE HA DESACTIVADO CORRECTAMENTE                 "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "${CIAN}"
                        echo "Pulsa Enter para salir "
                        read a
                        exit

elif [ $estado = 22 ]
then
                        clear
                        echo "\v\v\v"
                        echo "${ROJO}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                           LA REGLA NO ESTÁ CREADA                           "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "${CIAN}"
                        echo "Pulsa Enter para salir "
                        read a
                        exit
else

                        clear
                        echo "\v\v\v"
                        echo "${ROJO}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                      LA REGLA YA ESTABA DESACTIVADA              "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "${ROJO}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                          NO SE HA EFECTUADO NINGUN CAMBIO               "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "${CIAN}"
                        echo "Pulsa Enter para salir "
                        read a
                        exit


fi
