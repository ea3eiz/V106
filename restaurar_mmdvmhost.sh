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
echo "${VERDE}"
echo "   ************************************************************************"
echo "   *                                                                      *"
echo "                Restaurando MMDVMHost del dia 05-03-2021                   "
echo "   *                                                                      *"
echo "   ************************************************************************"
                                sudo rm -R /home/pi/MMDVMHost
                                cp -r -a /home/pi/.local/MMDVMHost_05-03-2021 /home/pi/
                                cd /home/pi/
                                mv MMDVMHost_05-03-2021 MMDVMHost
                                sudo chmod 777 -R MMDVMHost
                                sleep 3
                                exit;
