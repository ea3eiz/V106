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
                        echo "********************************************************************************"
                        echo "********************************************************************************"
                        echo "                             EDITANDO REGLA Y ECHOTEST                            "
                        echo "********************************************************************************"
                        echo "********************************************************************************"

                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""

						#echo "Indicativo"
						echo "${VERDE}Introduce indicativo ECHOTEST ej: EA3EIZ "
						read indicativo
                        indicativo=`echo "$indicativo" | tr [:lower:] [:upper:]`
sudo sed -i "35c {'SYSTEM': '$indicativo', 'TS': 2, 'TGID': 9999, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE', 'ON': [], 'OFF': [],'RESET': []}," /opt/HBlink3/rules.py
                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
