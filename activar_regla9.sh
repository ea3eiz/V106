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
                        echo "                           ACTIVANDO REGLA Y PEER 9                          "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        estado=$(awk "NR==29" /home/pi/info.ini) #OJO!!! CAMBIAR A SU NUMEO *********************
                        if [ $estado = 3 ]
                        then
                        sudo sed -i "922c ENABLED: True" /opt/HBlink3/hblink.cfg #OJO!!! CAMBIAR A SU NUMEO *********************
                        line110=$(awk "NR==110" /opt/HBlink3/rules.py)
                        line110=${line110#"#"} #borra la primera letra de la variable
                        sudo sed -i "110c $line110" /opt/HBlink3/rules.py
                        
                        line111=$(awk "NR==111" /opt/HBlink3/rules.py)
                        line111=${line111#"#"} #borra la primera letra de la variable
                        sudo sed -i "111c $line111" /opt/HBlink3/rules.py
                        
                        line112=$(awk "NR==112" /opt/HBlink3/rules.py)
                        line112=${line112#"#"} #borra la primera letra de la variable
                        sudo sed -i "112c $line112" /opt/HBlink3/rules.py
                        
                        line113=$(awk "NR==113" /opt/HBlink3/rules.py)
                        line113=${line113#"#"} #borra la primera letra de la variable
                        sudo sed -i "113c $line113" /opt/HBlink3/rules.py
                        
                        sudo systemctl restart hbmon
                        sudo systemctl restart hblink
                        
                        sudo sed -i "29c 2" /home/pi/info.ini #OJO!!! CAMBIAR A SU NUMEO *********************
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
                        elif [ $estado = 29 ] #OJO!!! CAMBIAR A SU NUMEO *********************
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

