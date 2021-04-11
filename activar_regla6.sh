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
                        echo "                           ACTIVANDO REGLA Y PEER 6                          "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        estado=$(awk "NR==26" /home/pi/info.ini) #OJO!!! CAMBIAR A SU NUMEO *********************
                        if [ $estado = 3 ]
                        then
                        sudo sed -i "622c ENABLED: True" /opt/HBlink3/hblink.cfg #OJO!!! CAMBIAR A SU NUMEO *********************
                        line80=$(awk "NR==80" /opt/HBlink3/rules.py)
                        line80=${line80#"#"} #borra la primera letra de la variable
                        sudo sed -i "80c $line80" /opt/HBlink3/rules.py
                        
                        line81=$(awk "NR==81" /opt/HBlink3/rules.py)
                        line81=${line81#"#"} #borra la primera letra de la variable
                        sudo sed -i "81c $line81" /opt/HBlink3/rules.py
                        
                        line82=$(awk "NR==82" /opt/HBlink3/rules.py)
                        line82=${line82#"#"} #borra la primera letra de la variable
                        sudo sed -i "82c $line82" /opt/HBlink3/rules.py
                        
                        line83=$(awk "NR==83" /opt/HBlink3/rules.py)
                        line83=${line83#"#"} #borra la primera letra de la variable
                        sudo sed -i "83c $line83" /opt/HBlink3/rules.py
                        
                        sudo systemctl restart hbmon
                        sudo systemctl restart hblink
                        
                        sudo sed -i "26c 2" /home/pi/info.ini #OJO!!! CAMBIAR A SU NUMEO *********************
                        clear
                        echo "\v\v\v"
                        echo "${AMARILLO}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                      LA REGLA SE HA ACTIVADO CORRECTAMENTE                  "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        exit
                        elif [ $estado = 26 ] #OJO!!! CAMBIAR A SU NUMEO *********************
                        then
                        clear
                        echo "\v\v\v"
                        echo "${ROJO}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                          LA REGLA  NO ESTÁ CREADA                           "
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
                        echo "                         LA REGLA YA ESTABA ACTIVADA                         "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        exit
                        fi

