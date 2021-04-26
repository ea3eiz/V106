#!/bin/bash

sleep 5

# Comprueba si DVSWITCH está activado
estado_dvswitch=$(awk "NR==18" /home/pi/status.ini)
if [ "$estado_dvswitch" = "DVSWITCH=OFF" ];then
sudo systemctl stop ysfgateway.service
sudo systemctl stop dmr2ysf.service
sudo systemctl stop analog_bridge.service
sudo systemctl stop ircddbgateway.service
sudo systemctl stop md380-emu.service
sudo systemctl stop mmdvm_bridge.service
sudo systemctl stop nxdngateway.service
else
echo ""
fi
