#!/bin/bash
sudo chmod 777 -R /home/pi/Desktop
cp /home/pi/V105/Desktop/*.* /home/pi/Desktop

sudo chmod 777 /home/pi/.config/xfce4/desktop/icons.screen0-1904x1023.rc
sudo chmod 777 /home/pi/icons.screen0-1904x1023.rc
cp /home/pi/V105/skin2_icons.screen0-1904x1023.rc /home/pi/icons.screen0-1904x1023.rc

sudo cp /home/pi/V105/SKIN2_FONDO_ADER_V105.jpg /home/pi/V105/FONDO_ADER_V105.jpg
sudo chmod 777 /home/pi/V105/skin2_icons.screen0-1904x1023.rc
cp /home/pi/V105/skin2_icons.screen0-1904x1023.rc /home/pi/.config/xfce4/desktop/icons.screen0-1904x1023.rc

xfdesktop --reload




                                