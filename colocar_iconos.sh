#!/bin/bash

cp /home/pi/Desktop/*.* /home/pi
cp /home/pi/V106/Desktop/*.* /home/pi/Desktop
udo chmod 777 -R /home/pi/Desktop

cp /home/pi/icons.screen0-1904x1023.rc /home/pi/.config/xfce4/desktop
xfdesktop --reload

cp /home/pi/*.* /home/pi/Desktop
sudo chmod 777 -R /home/pi/Desktop


                                