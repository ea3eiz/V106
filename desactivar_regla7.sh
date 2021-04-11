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
                        echo "                           DESACTIVANDO REGLA Y PEER 7                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        estado=$(awk "NR==27" /home/pi/info.ini) # OJO CAMBIAR POR SU NUMERO ********
                        if [ $estado = 2 ]
                        then

                        sudo sed -i "722c ENABLED: False" /opt/HBlink3/hblink.cfg # OJO CAMBIAR POR SU NUMERO ********

                        line90=$(awk "NR==90" /opt/HBlink3/rules.py)
                        sudo sed -i "90c #$line90" /opt/HBlink3/rules.py

                        line91=$(awk "NR==91" /opt/HBlink3/rules.py)
                        sudo sed -i "91c #$line91" /opt/HBlink3/rules.py

                        line92=$(awk "NR==92" /opt/HBlink3/rules.py)
                        sudo sed -i "92c #$line92" /opt/HBlink3/rules.py

                        line93=$(awk "NR==93" /opt/HBlink3/rules.py)
                        sudo sed -i "93c #$line93" /opt/HBlink3/rules.py

                        sudo systemctl restart hbmon
                        sudo systemctl restart hblink

                        sudo sed -i "27c 3" /home/pi/info.ini # OJO CAMBIAR POR SU NUMERO ********
                        
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
                        elif [ $estado = 27 ] # OJO CAMBIAR POR SU NUMERO ********
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
