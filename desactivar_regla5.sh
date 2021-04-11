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
                        echo "                           DESACTIVANDO REGLA Y PEER 5                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        estado=$(awk "NR==25" /home/pi/info.ini) # OJO CAMBIAR POR SU NUMERO ********
                        if [ $estado = 2 ]
                        then

                        sudo sed -i "522c ENABLED: False" /opt/HBlink3/hblink.cfg # OJO CAMBIAR POR SU NUMERO ********

                        line70=$(awk "NR==70" /opt/HBlink3/rules.py)
                        sudo sed -i "70c #$line70" /opt/HBlink3/rules.py

                        line71=$(awk "NR==71" /opt/HBlink3/rules.py)
                        sudo sed -i "71c #$line71" /opt/HBlink3/rules.py

                        line72=$(awk "NR==72" /opt/HBlink3/rules.py)
                        sudo sed -i "72c #$line72" /opt/HBlink3/rules.py

                        line73=$(awk "NR==73" /opt/HBlink3/rules.py)
                        sudo sed -i "73c #$line73" /opt/HBlink3/rules.py

                        sudo systemctl restart hbmon
                        sudo systemctl restart hblink

                        sudo sed -i "25c 3" /home/pi/info.ini # OJO CAMBIAR POR SU NUMERO ********
                        
                        clear
                        echo "\v\v\v"
                        echo "${AMARILLO}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                    LA REGLA SE HA DESACTIVADO CORRECTAMENTE                 "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        exit
                        elif [ $estado = 25 ] # OJO CAMBIAR POR SU NUMERO ********
                        then
                        clear
                        echo "\v\v\v"
                        echo "${ROJO}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                           LA REGLA NO ESTÁ CREADA                           "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
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
                        sleep 5
                        exit
                        fi
