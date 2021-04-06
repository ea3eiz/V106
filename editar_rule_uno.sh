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
                        echo "                                EDITANDO DASHBOARD                                "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"

                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""

						#echo "Indicativo tg conexión y tg desconexión Reflector"
						echo "Introduce indicativo  ej: EA3EIZ "
						read ind
                        echo "Introduce tg conexión ej: 4373 "
						read tgc
                        echo "Introduce tg de desconexión ej: 84373"
                        read tgd
                        echo "Introduce tg de desconexión ej: DMR+4373"
                        read ref
sudo sed -i "38c '$ref': [ " /opt/HBlink3/rules.py                        
sudo sed -i "39c {'SYSTEM': '$ind', 'TS': 2, 'TGID': 4373, 'ACTIVE': False, 'TIMEOUT': 10, 'TO_TYPE': 'ON',  'ON': [$tgc], 'OFF': [$tgd], 'RESET': []}," /opt/HBlink3/rules.py
sudo sed -i "40c {'SYSTEM': '$ref', 'TS': 2, 'TGID': 9, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py
sudo sed -i "213c [$ref] " /opt/HBlink3/hblink.cfg

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
