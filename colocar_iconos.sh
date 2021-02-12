#!/bin/bash

cp /home/pi/Desktop/*.desktop /home/pi
cp /home/pi/V106/Desktop/*.desktop /home/pi/Desktop

cp /home/pi/icons.screen0-1904x1023.rc /home/pi/.config/xfce4/desktop
xfdesktop --reload

cp /home/pi/*.desktop /home/pi/Desktop
sudo rm /home/pi/*.desktop
sudo chmod 777 -R /home/pi/Desktop


                                