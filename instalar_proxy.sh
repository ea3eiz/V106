#!/bin/bash

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp top.desktop /home/pi
#sed -i "4c DV4mini=ON" /home/pi/status.ini
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_m17.sh'" /home/pi/top.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_M17_ON.png" /home/pi/top.desktop
sed -i "11c Name[es_ES]=Cerrar M17" /home/pi/top.desktop
#sed -i "4c DV4mini=ON" /home/pi/status.ini
cd /home/pi
wget http://www.echolink.org/downloads/EchoLinkProxy_1_2_3.zip
unzip EchoLinkProxy_1_2_3.zip