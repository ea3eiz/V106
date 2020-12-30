#!/bin/bash
sudo killall DMR2YSF
sudo killall YSFGateway

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

marca_dvswitch=$(awk "NR==20" /home/pi/status.ini)
if [ "$marca_dvswitch" = 'MARCA_DVSWITCH=ON' ];then

echo "${BLANCO}"
echo "                  ******************************************"
echo "                  *           Al cerrar DMR2YSF            *"
echo "                  *          ${VERDE}se Activa DVSWITCH ${BLANCO}           *"
echo "                  ******************************************"
sleep 3

# Activa DVSWITCH 
cd /home/pi/V106
sh ejecutar_dvswitch.sh

else

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_DMR2YSF.desktop /home/pi

sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=77x15 -e sudo sh ejecutar_DMR2YSF.sh'" /home/pi/Abrir_DMR2YSF.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMR2YSF_OFF.png" /home/pi/Abrir_DMR2YSF.desktop
sed -i "10c Name[es_ES]=Abrir DMR2YSF" /home/pi/Abrir_DMR2YSF.desktop
sed -i "15c DMR2YSF=OFF" /home/pi/status.ini

cd /home/pi
sudo cp Abrir_DMR2YSF.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_DMR2YSF.desktop
fi