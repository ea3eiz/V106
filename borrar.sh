#!/bin/bash
zenity --question --text="Quieres activar DVSWITCH?" 
if [ $? = 0 ]; then 

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)

echo "${VERDE}" 

cd /home/pi/Desktop
sudo cp Activar_dvswitch.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh stop_dvswitch.sh'" /home/pi/Activar_dvswitch.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DVSWITCH_ON.png" /home/pi/Activar_dvswitch.desktop
sed -i "10c Name[es_ES]=Parar Dvswitch" /home/pi/Activar_dvswitch.desktop


sed -i "18c DVSWITCH=ON" /home/pi/status.ini

cd /home/pi
sudo cp Activar_dvswitch.desktop /home/pi/Desktop

sudo rm /home/pi/Activar_dvswitch.desktop

# Pone Enable=1 en [Dstar Network]
sed -i "62c Enable=1" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sed -i "62c Enable=1" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini
sed -i "62c Enable=1" /opt/MMDVM_Bridge/brandmeister_esp.ini
sed -i "62c Enable=1" /opt/MMDVM_Bridge/dmrplus.ini
sed -i "62c Enable=1" /opt/MMDVM_Bridge/especial.ini

sudo systemctl restart ysfgateway.service
sudo systemctl restart dmr2ysf.service

sudo systemctl restart analog_bridge.service
sudo systemctl restart ircddbgateway.service
sudo systemctl restart md380-emu.service
sudo systemctl restart mmdvm_bridge.service
sudo systemctl restart nxdngateway.service

zenity --info --ok-label= --title=DVSWITCH --window-icon=/home/pi/V106/ICONO_DVSWITCH_ON.png --width=400 --timeout=5 --text "\n\nDVSWITCH ACTIVADO"
sed -i "18c DVSWITCH=ON" /home/pi/status.ini
else
exit
fi
	
			