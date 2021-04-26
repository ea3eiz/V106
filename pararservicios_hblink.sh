#!/bin/bash

sleep 5

# Comprueba si HBLINK está activado
estado_hblink=$(awk "NR==50" /home/pi/info.ini)
if [ "$estado_hblink" = "HBLINK=OFF" ];then
sudo systemctl stop hbmon.service
sudo systemctl stop hblink.service
else
echo ""
sudo systemctl restart hbmon.service
sudo systemctl restart hblink.service
fi
