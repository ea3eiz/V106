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

						#echo "Dashboard of local DMR network"
						echo "Introduce el titulo del dashboard ej: Dashboard EA3EIZ 2143175 "
						read dashboard
						sudo sed -i "1c REPORT_NAME     = '$dashboard'" /opt/HBmonitor/config.py

                        #echo "puerto del Dashboard"
						echo "Introduce puerto del dashboard ej: 8080 u otro"
						read puerto
						sudo sed -i "9c WEB_SERVER_PORT = $puerto" /opt/HBmonitor/config.py

						sudo systemctl restart hblink & sudo systemctl restart hbmon &

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
