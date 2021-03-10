#!/bin/bash

sed -i "20c MARCA_DVSWITCH=OFF" /home/pi/status.ini

sed -i "18c DVSWITCH=OFF" /home/pi/status.ini

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)

cd /home/pi/Desktop
sudo cp Activar_dvswitch.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_dvswitch.sh'" /home/pi/Activar_dvswitch.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DVSWITCH_OFF.png" /home/pi/Activar_dvswitch.desktop
sed -i "10c Name[es_ES]=Activar Dvswitch" /home/pi/Activar_dvswitch.desktop
cd /home/pi
sudo cp Activar_dvswitch.desktop /home/pi/Desktop
sudo rm /home/pi/Activar_dvswitch.desktop

sudo systemctl stop ysfgateway.service
sudo systemctl stop dmr2ysf.service

sudo systemctl stop analog_bridge.service
sudo systemctl stop ircddbgateway.service
sudo systemctl stop md380-emu.service
sudo systemctl stop mmdvm_bridge.service
sudo systemctl stop nxdngateway.service

#zenity --info --ok-label= --title=DVSWITCH --window-icon=/home/pi/V106/ICONO_DVSWITCH_OFF.png --width=400 --timeout=5 --text "\n\n\nDVSWITCH DESACTIVADO"

/home/pi/V106/./qt_dvswitch_desactivado
cd /home/pi/V106
sudo sh cerrar_solodstar.sh
sudo sh cerrar_ircDDB.sh
