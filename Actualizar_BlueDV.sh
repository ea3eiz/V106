#!/bin/bash
clear
while true
do
clear
# path usuario
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)

# Versión
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

echo "${VERDE}"
echo "   **************************************************************************"
echo "                       Script para actualizar BlueDV                       "
echo "${ROJO}                                   By EA3EIZ ${VERDE}                 "
echo "   **************************************************************************"
echo "\33[1;36m   1)${AMARILLO} Actualizar BlueDV a la Versión 9593 ${VERDE} (NEW)"
echo "\33[1;36m   2)\33[1;37m Volver a BlueDV Versión 9582"
echo ""
echo -n "\33[1;36m   Elige una opción: " 
read escoger_menu
echo ""
case $escoger_menu in
1) echo ""
while true
do
			clear
			echo "\33[1;33m"
	        read -p ' Quieres actualizar BlueDV Versión 9593 Si/No: ' ejecutar1
		    case $ejecutar1 in
			[sS]* ) echo ""
			echo "ok >>>>>"
			if [ -d /home/pi/bluedv_anterior/ ];
			then
			clear
			echo "\v\v\v"
			echo "${VERDE}"
			echo "   **************************************************************************"
			echo "                    YA TIENES ACTUALIZADA LA VERSIÓN 9593             "
			echo "   **************************************************************************"
			sleep 1
			clear
			echo "${BLANCO}"
			echo "\v\v\v"
			echo "   **************************************************************************"
			echo "                    YA TIENES ACTUALIZADA LA VERSIÓN 9593             "
			echo "   **************************************************************************"
			sleep 1
			clear
			echo "${AMARILLO}"
			echo "\v\v\v"
			echo "   **************************************************************************"
			echo "                    YA TIENES ACTUALIZADA LA VERSIÓN 9593            "
			echo "   **************************************************************************"
			sleep 1
			clear
			echo "${ROJO}"
			echo "\v\v\v"
			echo "   **************************************************************************"
			echo "                    YA TIENES ACTUALIZADA LA VERSIÓN 9593             "
			echo "   **************************************************************************"
			sleep 1
			clear
			echo "${VERDE}"
			echo "\v\v\v"
			echo "   **************************************************************************"
			echo "                    YA TIENES ACTUALIZADA LA VERSIÓN 9593             "
			echo "   **************************************************************************"
			sleep 3
 			else
			cd /home/pi/
			mkdir bluedv_anterior
			cp bluedv/*.* bluedv_anterior/
			rm -r /home/pi/bluedv
			git clone https://github.com/ea3eiz/bluedv9593			
			mv /home/pi/bluedv9593 /home/pi/bluedv
			sudo chmod 777 DExtra_Hosts.txt		
			fi	
			exit;
		    echo ""
			echo "Ok, se ha ejecutado correctamente"
			echo ""
			break;;
			[nN]* ) echo ""
			exit;
			break;;
esac
done;;
2) echo ""
while true
do
			clear
			echo "\33[1;33m"
	        read -p ' Quieres volver a BlueDV Versión 9582 Si/No: ' ejecutar1
		    case $ejecutar1 in
			[sS]* ) echo ""
			echo "ok >>>>>"
			if [ -d /home/pi/bluedv_anterior/ ];
			then
			clear
			echo "\33[1;32mVOLVIENDO A LA VERSIÓN 9582"
			sleep 1
			clear
			echo "\33[1;31mVOLVIENDO A LA VERSIÓN 9582"
			sleep 1
			clear
			echo "\33[1;32mVOLVIENDO A LA VERSIÓN 9582"
			sleep 1
			clear
			echo "\33[1;31mVOLVIENDO A LA VERSIÓN 9582"
			sleep 1
			clear
			echo "\33[1;32m***********************************"
			echo "\33[1;32m* VOLVIENDO A LA VERSIÓN 9582     *"
			echo "\33[1;32m***********************************"
			sleep 5
			cd /home/pi/
            sudo cp /home/pi/bluedv_anterior/*.* /home/pi/bluedv/
            sudo rm -R bluedv_anterior			
			else
			clear
			echo "\33[1;32mYA ESTÁS EN LA VERSIÓN 9582"
			sleep 1
			clear
			echo "\33[1;31mYA ESTÁS EN LA VERSIÓN 9582"
			sleep 1
			clear
			echo "\33[1;32mYA ESTÁS EN LA VERSIÓN 9582"
			sleep 1
			clear
			echo "\33[1;31mYA ESTÁS EN LA VERSIÓN 9582"
			sleep 1
			clear
			echo "\33[1;32m*************************************************************"
			echo "\33[1;32m*            YA ESTÁS EN LA VERSIÓN 9582                    *"
			echo "\33[1;32m*************************************************************"
			sleep 5	
			fi	
			exit;
		    echo ""
			echo "Ok, se ha ejecutado correctamente"
			echo ""
			break;;
			[nN]* ) echo ""
			break;;
esac
done;;
0) echo ""
clear
exit;;	
esac
done


