#!/bin/bash

# recupera los iconos pero no los que se han quedado con e icono de un libro
# y quita los semaforos que se queden encendidos por error al reiniciar
#cp /home/pi/Desktop/*.desktop /home/pi
#cp /home/pi/V106/Desktop/*.desktop /home/pi/Desktop
#
#cp /home/pi/icons.screen0-1904x1023.rc /home/pi/.config/xfce4/desktop
#xfdesktop --reload
#
#cp /home/pi/*.desktop /home/pi/Desktop
#sudo rm /home/pi/*.desktop
#sudo chmod 777 -R /home/pi/Desktop

# recupera los iconos que se han borrado y se han convertido en icono de un libro
# pero no quita los semaforos que se queden encendidos por error al reiniciar
sudo cp /home/pi/V106/Desktop/*.* /home/pi/Desktop
sudo chmod 777 -R /home/pi/Desktop

cp /home/pi/icons.screen0-1904x1023.rc /home/pi/.config/xfce4/desktop
xfdesktop --reload                              