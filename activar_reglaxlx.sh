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
                        echo "                           ACTIVANDO REGLA Y PEER XLX                        "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        estado=$(awk "NR==30" /home/pi/info.ini) #OJO!!! CAMBIAR A SU NUMEO *********************
                        if [ $estado = 3 ]
                        then
                        sudo sed -i "1022c ENABLED: True" /opt/HBlink3/hblink.cfg #OJO!!! CAMBIAR A SU NUMEO *********************
                        
                        line120=$(awk "NR==120" /opt/HBlink3/rules.py)
                        line120=${line120#"#"} #borra la primera letra de la variable
                        sudo sed -i "120c $line120" /opt/HBlink3/rules.py
                        
                        line121=$(awk "NR==121" /opt/HBlink3/rules.py)
                        line121=${line121#"#"} #borra la primera letra de la variable
                        sudo sed -i "121c $line121" /opt/HBlink3/rules.py
                        
                        line122=$(awk "NR==122" /opt/HBlink3/rules.py)
                        line122=${line122#"#"} #borra la primera letra de la variable
                        sudo sed -i "122c $line122" /opt/HBlink3/rules.py
                        
                        line123=$(awk "NR==123" /opt/HBlink3/rules.py)
                        line123=${line123#"#"} #borra la primera letra de la variable
                        sudo sed -i "123c $line123" /opt/HBlink3/rules.py
                        
                        line124=$(awk "NR==124" /opt/HBlink3/rules.py)
                        line124=${line124#"#"} #borra la primera letra de la variable
                        sudo sed -i "124c $line124" /opt/HBlink3/rules.py

                        sudo systemctl restart hbmon
                        sudo systemctl restart hblink
                        
                        sudo sed -i "30c 2" /home/pi/info.ini #OJO!!! CAMBIAR A SU NUMEO *********************
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
                        elif [ $estado = 30 ] #OJO!!! CAMBIAR A SU NUMEO *********************
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

