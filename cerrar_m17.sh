#!/bin/bash
sudo killall mvoice
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp top.desktop /home/pi
sleep 1
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_m17.sh'" /home/pi/top.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_M17_OFF.png" /home/pi/top.desktop
sed -i "11c Name[es_ES]=Abrir M17" /home/pi/top.desktop
#sed -i "4c DV4mini=OFF" /home/pi/status.ini
sleep 1
cd /home/pi
sudo cp top.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/top.desktop
