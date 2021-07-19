#!/bin/bash

cd /home/pi/Desktop
cp ABRIR_DMR2M17.desktop /home/pi
sed -i "6c Exec=sh -c 'cd /home/pi/V106; sudo sh ejecutar_DMR2M17.sh'" /home/pi/ABRIR_DMR2M17.desktop
sed -i "7c Icon=/home/pi/V106/ICONO_M17_OFF.png" /home/pi/ABRIR_DMR2M17.desktop
sed -i "4c Name[es_ES]=Abrir DMR2M17" /home/pi/ABRIR_DMR2M17.desktop
sed -i "31c DMR2M17=OFF" /home/pi/status.ini
cd /home/pi
cp ABRIR_DMR2M17.desktop /home/pi/Desktop

sudo rm /home/pi/ABRIR_DMR2M17.desktop

sudo killall DMR2M17
sudo killall MMDVMDMR2M17



  