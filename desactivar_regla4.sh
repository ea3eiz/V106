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
                        echo "                           DESACTIVANDO REGLA Y PEER 4                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        estado=$(awk "NR==24" /home/pi/info.ini) # OJO CAMBIAR POR SU NUMERO ********
                        if [ $estado = 2 ]
                        then

                        sudo sed -i "422c ENABLED: False" /opt/HBlink3/hblink.cfg # OJO CAMBIAR POR SU NUMERO ********

                        line60=$(awk "NR==60" /opt/HBlink3/rules.py)
                        sudo sed -i "60c #$line60" /opt/HBlink3/rules.py

                        line61=$(awk "NR==61" /opt/HBlink3/rules.py)
                        sudo sed -i "61c #$line61" /opt/HBlink3/rules.py

                        line62=$(awk "NR==62" /opt/HBlink3/rules.py)
                        sudo sed -i "62c #$line62" /opt/HBlink3/rules.py

                        line63=$(awk "NR==63" /opt/HBlink3/rules.py)
                        sudo sed -i "63c #$line63" /opt/HBlink3/rules.py

                        sudo systemctl restart hbmon
                        sudo systemctl restart hblink

                        sudo sed -i "24c 3" /home/pi/info.ini # OJO CAMBIAR POR SU NUMERO ********
                        
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
                        elif [ $estado = 24 ] # OJO CAMBIAR POR SU NUMERO ********
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
