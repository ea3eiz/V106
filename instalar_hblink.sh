#!/bin/bash
clear
apt update

clear
sleep 2
apt install python3-distutils

cd /opt/
wget https://bootstrap.pypa.io/get-pip.py
clear
sleep 2

python3 get-pip.py
clear
sleep 2
apt install python3-twisted

clear
sleep 2
apt install python3-bitarray

clear
sleep 2
apt install python3-dev

clear
sleep 2
git clone https://github.com/lz5pn/HBlink3

clear
sleep 2
mv /opt/HBlink3/ /opt/backup/
mv /opt/backup/HBlink3/ /opt/
mv /opt/backup/HBmonitor/ /opt/

clear
sleep 2
chmod +x -R /opt/HBmonitor

clear
sleep 2
sudo mv /opt/backup/dmr_utils3/ /opt/
sudo rm -r /opt/backup/

clear
sleep 2
cd /opt/dmr_utils3
chmod +x install.sh

clear
sleep 2
./install.sh

clear
sleep 2
/usr/bin/python3 -m pip install --upgrade pip

clear
sleep 2
pip install --upgrade dmr_utils3

clear
sleep 2
cd /opt/HBlink3
cp hblink-SAMPLE.cfg hblink.cfg

clear
sleep 2
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

clear
sleep 2
sudo systemctl daemon-reload
sudo systemctl enable hblink

clear
sleep 2
#Instalar Parrot para  Echotest:
chmod +x playback.py

clear
sleep 2
#Crear directorio  /var/log/hblink si no está creado
mkdir /var/log/hblink

clear
sleep 2
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

clear
sleep 2
systemctl enable parrot.service
systemctl start parrot.service
#sudo systemctl status parrot.service

clear
sleep 2
#Configurar HBlink
#nano /opt/HBlink3/hblink.cfg
#nano /opt/HBlink3/rules.py

clear
sleep 2
#Test de configuración:
python3 /opt/HBlink3/bridge.py

#Si es ok salir con  "ctrl-c" y start los servicios

systemctl start hblink
#sudo systemctl status hblink

clear
sleep 2
#Instalar web monitor para HBLink.
cd /opt/HBmonitor
chmod +x install.sh

clear
sleep 2
./install.sh

clear
sleep 2
cp config_SAMPLE.py config.py

clear
sleep 2
#Start monitor service:
cp utils/hbmon.service /lib/systemd/system/

echo "pulsa una tecla para continuar"
read a
systemctl enable hbmon
systemctl start hbmon
#systemctl status hbmon
clear
echo "********* FIN *****"
