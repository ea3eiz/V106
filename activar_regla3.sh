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
                        echo "                           ACTIVANDO REGLA Y PEER 3                          "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        estado=$(awk "NR==23" /home/pi/info.ini) #OJO!!! CAMBIAR A SU NUMEO *********************
                        if [ $estado = 3 ]
                        then
                        sudo sed -i "322c ENABLED: True" /opt/HBlink3/hblink.cfg
                        line50=$(awk "NR==50" /opt/HBlink3/rules.py)
                        line50=${line50#"#"} #borra la primera letra de la variable
                        sudo sed -i "50c $line50" /opt/HBlink3/rules.py
                        
                        line51=$(awk "NR==51" /opt/HBlink3/rules.py)
                        line51=${line51#"#"} #borra la primera letra de la variable
                        sudo sed -i "51c $line51" /opt/HBlink3/rules.py
                        
                        line52=$(awk "NR==52" /opt/HBlink3/rules.py)
                        line52=${line52#"#"} #borra la primera letra de la variable
                        sudo sed -i "52c $line52" /opt/HBlink3/rules.py
                        
                        line53=$(awk "NR==53" /opt/HBlink3/rules.py)
                        line53=${line53#"#"} #borra la primera letra de la variable
                        sudo sed -i "53c $line53" /opt/HBlink3/rules.py
                        
                        sudo systemctl restart hbmon
                        sudo systemctl restart hblink
                        
                        sudo sed -i "23c 2" /home/pi/info.ini #OJO!!! CAMBIAR A SU NUMEO *********************
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
                        elif [ $estado = 23 ] #OJO!!! CAMBIAR A SU NUMEO *********************
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

