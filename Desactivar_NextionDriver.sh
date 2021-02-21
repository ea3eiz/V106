#!/bin/bash
/home/pi/V106/./nextiondriver_desactivar
# path usuario
usuario="/home/pi"
usuario=$(awk "NR==1" $usuario/.config/autostart/usuario)
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"
echo "${AMARILLO}"
echo "\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v"
echo -n " Quieres Desactivar NextionDriver S/N ? "
read desactivar
case "$desactivar" in
[sS]* )
clear
echo "${VERDE}"
echo " *********************************************************************"
echo " *                                                                   *"
echo " *     <<<<<<<<      DESACTIVANDO NextionDriver      >>>>>>>>>       *"
echo " *                                                                   *"
echo " *********************************************************************"
sleep 3

sudo cp $usuario/Desktop/Activar_NextionDriver.desktop $usuario
sudo sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; ./qt_activar_nextiondriver'" $usuario/Activar_NextionDriver.desktop
sudo sed -i "5c Icon=$usuario/$SCRIPTS_version/ICONO_NEXTIONDRIVER_OFF.png" $usuario/Activar_NextionDriver.desktop
sudo sed -i "10c Name[es_ES]=Activar NextionDriver" $usuario/Activar_NextionDriver.desktop
cd $usuario
sudo cp Activar_NextionDriver.desktop $usuario/Desktop
sleep 2
sudo rm Activar_NextionDriver.desktop

sudo sed -i "4c #Exec=sh -c 'cd $usuario/NextionDriver/;sudo ./NextionDriver -c $usuario/MMDVMHost/MMDVM.ini'" $usuario/.config/autostart/nextiondriver.desktop
sed -i "22c NEXTIONDRIVER=OFF" /home/pi/status.ini
read a
sudo reboot

break;;
[nN]*) 
exit ;;
esac