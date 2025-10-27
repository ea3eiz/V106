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

            
			cp /home/pi/V106/YSFHosts.txt /home/pi/YSFClients/YSFGateway/
			
			echo "${VERDE}******************************************"
					echo "* ACTUALIZANDO REFLECTORES YSFHosts.txt  *"
					echo "******************************************"
			sleep 3