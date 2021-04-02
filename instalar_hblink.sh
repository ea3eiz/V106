#!/bin/bash

sudo su
echo "sudo su"
read a
clear
apt update
echo "apt update"
read a
#apt upgrade
#apt dist-upgrade
#apt autoremove
#apt autoclean

#install hblink
#apt install git
apt install python3-distutils
cd /opt/
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
apt install python3-twisted
apt install python3-bitarray
apt install python3-dev
git clone https://github.com/lz5pn/HBlink3
mv /opt/HBlink3/ /opt/backup/
mv /opt/backup/HBlink3/ /opt/
mv /opt/backup/HBmonitor/ /opt/

chmod 777 -R /opt/HBmonitor

mv /opt/backup/dmr_utils3/ /opt/
rm -r /opt/backup/
cd /opt/dmr_utils3
chmod +x install.sh
./install.sh
/usr/bin/python3 -m pip install --upgrade pip
pip install --upgrade dmr_utils3
cd /opt/HBlink3
cp hblink-SAMPLE.cfg hblink.cfg
cp rules-SAMPLE.py rules.py

#Autostart HBLink:
nano /lib/systemd/system/hblink.service
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

systemctl daemon-reload
systemctl enable hblink

#Instalar Parrot para  Echotest:
chmod +x playback.py

#Crear directorio  /var/log/hblink si no está creado
mkdir /var/log/hblink

#Crear servicio para el parrot /lib/systemd/system/parrot.service 
nano /lib/systemd/system/parrot.service
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

systemctl enable parrot.service
systemctl start parrot.service
systemctl status parrot.service

#Configurar HBlink
nano /opt/HBlink3/hblink.cfg
nano /opt/HBlink3/rules.py

#Test de configuración:
python3 /opt/HBlink3/bridge.py

#Si es ok salir con  "ctrl-c" y start los servicios

systemctl start hblink
systemctl status hblink

#Instalar web monitor para HBLink.
cd /opt/HBmonitor
chmod +x install.sh
./install.sh
cp config_SAMPLE.py config.py
nano /opt/HBmonitor/config.py

#Start monitor service:
cp utils/hbmon.service /lib/systemd/system/
systemctl enable hbmon
systemctl start hbmon
systemctl status hbmon

