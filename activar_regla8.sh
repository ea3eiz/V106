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
                        echo "                           ACTIVANDO REGLA Y PEER 8                          "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        estado=$(awk "NR==28" /home/pi/info.ini) #OJO!!! CAMBIAR A SU NUMEO *********************
                        if [ $estado = 3 ]
                        then
                        sudo sed -i "822c ENABLED: True" /opt/HBlink3/hblink.cfg #OJO!!! CAMBIAR A SU NUMEO *********************
                        line100=$(awk "NR==100" /opt/HBlink3/rules.py)
                        line100=${line100#"#"} #borra la primera letra de la variable
                        sudo sed -i "100c $line100" /opt/HBlink3/rules.py
                        
                        line101=$(awk "NR==101" /opt/HBlink3/rules.py)
                        line101=${line101#"#"} #borra la primera letra de la variable
                        sudo sed -i "101c $line101" /opt/HBlink3/rules.py
                        
                        line102=$(awk "NR==102" /opt/HBlink3/rules.py)
                        line102=${line102#"#"} #borra la primera letra de la variable
                        sudo sed -i "102c $line102" /opt/HBlink3/rules.py
                        
                        line103=$(awk "NR==103" /opt/HBlink3/rules.py)
                        line103=${line103#"#"} #borra la primera letra de la variable
                        sudo sed -i "103c $line103" /opt/HBlink3/rules.py
                        
                        sudo systemctl restart hbmon
                        sudo systemctl restart hblink
                        
                        sudo sed -i "28c 2" /home/pi/info.ini #OJO!!! CAMBIAR A SU NUMEO *********************
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
                        elif [ $estado = 28 ] #OJO!!! CAMBIAR A SU NUMEO *********************
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

