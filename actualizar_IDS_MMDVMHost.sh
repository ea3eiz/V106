#!/bin/bash
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"
NEGRO="\33[0;30m"
clear
echo ""
echo -n "${AMARILLO}"
echo "    ACTUALIZANDO IDS INDICATIVOS"
echo -n "${VERDE}"
#echo "ACTUALIZANDO DMRIds.dat para DVSWITCH"
sleep 3



                        # 14-08-2020 cambio actualizar para que salgan los indicativos en DVSWITCH:
                        cd /var/lib/mmdvm
                        sudo curl --fail -o DMRIds.dat -s http://www.pistar.uk/downloads/DMRIds.dat
                        sudo chmod 777 -R /var/lib/mmdvm

                        cp DMRIds.dat /home/pi/DMR2YSF/
                        #sudo curl --fail -o DMRIds.dat -s http://www.pistar.uk/downloads/DMRIds.dat

                        cp DMRIds.dat /home/pi/MMDVMHost/
