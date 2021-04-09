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

string="|abcdefg|" string2=${string#"|"} string2=${string2%"|"} echo $string2

Fuente: https://www.enmimaquinafunciona.com/pregunta/25223/-bash-elimina-el-primer-y-el-ultimo-caracter-de-una-cadena-

line40=$(awk "NR==40" /opt/HBlink3/rules.py)
line40${line40#"#"} #borra la primera letra de la variable
sleep 2
sudo sed -i "40c $line40" /opt/HBlink3/rules.py



                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
