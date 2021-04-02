#!/bin/bash

echo "pulsa una tecla para continuar"
read a
sudo systemctl enable parrot.service
sudo systemctl start parrot.service
#sudo systemctl status parrot.service

echo "pulsa una tecla para continuar"
read a
#Configurar HBlink
sudo nano /opt/HBlink3/hblink.cfg
sudo nano /opt/HBlink3/rules.py

echo "pulsa una tecla para continuar"
read a
#Test de configuración:
sudo python3 /opt/HBlink3/bridge.py

#Si es ok salir con  "ctrl-c" y start los servicios

sudo systemctl start hblink
#sudo systemctl status hblink

echo "pulsa una tecla para continuar"
read a
#Instalar web monitor para HBLink.
cd /opt/HBmonitor
sudo chmod +x install.sh

echo "pulsa una tecla para continuar"
read a
sudo ./install.sh

echo "pulsa una tecla para continuar"
read a
sudo cp config_SAMPLE.py config.py
sudo nano /opt/HBmonitor/config.py

echo "pulsa una tecla para continuar"
read a
#Start monitor service:
sudo cp utils/hbmon.service /lib/systemd/system/

echo "pulsa una tecla para continuar"
read a
sudo systemctl enable hbmon
sudo systemctl start hbmon
#sudo systemctl status hbmon

