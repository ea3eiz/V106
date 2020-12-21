#!/bin/bash

mode=`grep -n -m 1 "^Port=" /home/pi/MMDVMHost/MMDVMFUSION.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMFUSION.ini)
puerto=`expr substr $mode 11 9`
puerto="  "$puerto

rxfrecuencia=$(awk "NR==2" /home/pi/YSF2DMR/YSF2DMR.ini)
rxfrecuencia=`expr substr $rxfrecuencia 13 17`
rxfrecuencia=$rxfrecuencia

txfrecuencia=$(awk "NR==3" /home/pi/YSF2DMR/YSF2DMR.ini)
txfrecuencia=`expr substr $txfrecuencia 13 17`
txfrecuencia=$txfrecuencia


id=$(awk "NR==39" /home/pi/YSF2DMR/YSF2DMR.ini)
id=`expr substr $id 4 9`
id=$id

indicativo=$(awk "NR==13" /home/pi/YSF2DMR/YSF2DMR.ini)
indicativo=`expr substr $indicativo 10 8`
indicativo=$indicativo

options=$(awk "NR==54" /home/pi/YSF2DMR/YSF2DMR.ini)

bm=`expr substr $options 2 1`
if [ $bm = "O" ]
then
options="#Options="
else
options=`expr substr $options 9 45`
options=$options
fi

address=`grep -n -m 1 "^Address=" /home/pi/YSF2DMR/YSF2DMR.ini`
buscar=":"
caracteres=`expr index $address $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_address=`expr substr $address 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_address" /home/pi/YSF2DMR/YSF2DMR.ini)
address=`expr substr $address 12 35`
address="  "$address

memoria=$(awk "NR==25" /home/pi/.local/memorias)

#Modificación 31-10-2020 
sudo sed -i "1c Indicativo:   $indicativo" /home/pi/.local/memoria_ysf2dmr
sudo sed -i "2c Id:           $id" /home/pi/.local/memoria_ysf2dmr
sudo sed -i "3c RXFrecuencia: $rxfrecuencia" /home/pi/.local/memoria_ysf2dmr
sudo sed -i "4c TXFrecuencia: $txfrecuencia" /home/pi/.local/memoria_ysf2dmr
sudo sed -i "5c Puerto:     $puerto" /home/pi/.local/memoria_ysf2dmr
sudo sed -i "6c Address:    $address" /home/pi/.local/memoria_ysf2dmr
sudo sed -i "7c $options" /home/pi/.local/memoria_ysf2dmr
sudo sed -i "8c Memoria:      $memoria" /home/pi/.local/memoria_ysf2dmr

/home/pi/V105/./qt_info_ysf2dmr

#Colores
#ROJO="\033[1;31m"
#VERDE="\033[1;32m"
#BLANCO="\033[1;37m"
#AMARILLO="\033[1;33m"
#CIAN="\033[1;36m"
#GRIS="\033[0m"
#MARRON="\33[38;5;138m"
##figlet $puerto
#echo "${BLANCO}"
#echo "  $informacion (YSF2DMR)"
#echo "${VERDE}"
#echo "  ******************************************"
#echo "${CIAN}  Indicativo:   ${AMARILLO}$indicativo   "
#echo "${CIAN}  Id:           ${AMARILLO}$id   "
#echo "${CIAN}  RXFrecuencia: ${AMARILLO}$rxfrecuencia   "
#echo "${CIAN}  TXFrecuencia: ${AMARILLO}$txfrecuencia   "
#echo "${CIAN}  Puerto:     ${AMARILLO}$puerto   "
#echo "${CIAN}  Servidor:   ${AMARILLO}$address   "
#echo "${CIAN}  Options:      ${AMARILLO}$options   "
#echo "${CIAN}  Memoria:      ${AMARILLO}$memoria   "
#echo -n "${VERDE}"
#echo "  ******************************************"
#
#echo -n "${CIAN}  Pulsa enter para cerrar esta ventana "
#read a
#
## echo -n "${MARRON}"
## echo -n "  Se cerrará en 10."
## sleep 1
## echo -n "9."
## sleep 1
## echo -n "8."
## sleep 1
## echo -n "7."
## sleep 1
## echo -n "6."
## sleep 1
## echo -n "5."
## sleep 1
## echo -n "4."
## sleep 1
## echo -n "3."
## sleep 1
## echo -n "2."
## sleep 1
## echo -n "1."
## sleep 1
## echo -n "0"
## sleep 1