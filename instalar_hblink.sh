#!/bin/bash
clear

echo "apt update"
read a
sudo apt update

echo "apt install python3-distutils"
read a
sudo apt install python3-distutils

cd /opt/
wget https://bootstrap.pypa.io/get-pip.py
echo "pulsa una tecla para continuar"
read a

sudo python3 get-pip.py
echo "pulsa una tecla para continuar"
read a
sudo apt install python3-twisted

echo "pulsa una tecla para continuar"
read a
sudo apt install python3-bitarray

echo "pulsa una tecla para continuar"
read a
sudo apt install python3-dev

echo "pulsa una tecla para continuar"
read a
git clone https://github.com/lz5pn/HBlink3

echo "pulsa una tecla para continuar"
read a
sudo mv /opt/HBlink3/ /opt/backup/
sudo mv /opt/backup/HBlink3/ /opt/
sudo mv /opt/backup/HBmonitor/ /opt/

echo "pulsa una tecla para continuar"
read a
sudo chmod 777 -R /opt/HBmonitor

echo "pulsa una tecla para continuar"
read a
sudo mv /opt/backup/dmr_utils3/ /opt/
sudo rm -r /opt/backup/

echo "pulsa una tecla para continuar"
read a
cd /opt/dmr_utils3
sudo chmod +x install.sh

echo "pulsa una tecla para continuar"
read a
sudo ./install.sh

echo "pulsa una tecla para continuar"
read a
sudo /usr/bin/python3 -m pip install --upgrade pip

echo "pulsa una tecla para continuar"
read a
sudo pip install --upgrade dmr_utils3

echo "pulsa una tecla para continuar"
read a
cd /opt/HBlink3
sleep 1
sudo cp hblink-SAMPLE.cfg hblink.cfg
sleep 1
sudo cp rules-SAMPLE.py rules.py

#Autostart HBLink:
sudo nano /lib/systemd/system/hblink.service
#Copiar y pegar el contenido siguiente:
____________________________________________
[Unit]
Description=Start HBlink
After=multi-user.target
[Service]
ExecStart=/usr/bin/python3 /opt/HBlink3/bridge.py
[Install]
WantedBy=multi-user.target
______________________________________________

echo "pulsa una tecla para continuar"
read a
sudo systemctl daemon-reload
sudo systemctl enable hblink

echo "pulsa una tecla para continuar"
read a
#Instalar Parrot para  Echotest:
sudo chmod +x playback.py

echo "pulsa una tecla para continuar"
read a
#Crear directorio  /var/log/hblink si no está creado
sudo mkdir /var/log/hblink

echo "pulsa una tecla para continuar"
read a
#Crear servicio para el parrot /lib/systemd/system/parrot.service 
sudo nano /lib/systemd/system/parrot.service
#Copiar y pegar el contenido siguiente:
____________________________________________
[Unit]
Description=HB bridge all Service
After=network-online.target syslog.target
Wants=network-online.target
[Service]
StandardOutput=null
WorkingDirectory=/opt/HBlink3
RestartSec=3
ExecStart=/usr/bin/python3 /opt/HBlink3/playback.py -c /opt/HBlink3/playback.cfg
Restart=on-abort
[Install]
WantedBy=multi-user.target
____________________________________________

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
sudo cp /opt/HBmonitor/utils/hbmon.service /lib/systemd/system/

echo "pulsa una tecla para continuar"
read a
sudo systemctl enable hbmon
sudo systemctl start hbmon
#sudo systemctl status hbmon

