#!/bin/bash
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"
apt update

sleep 2
apt install python3-distutils

cd /opt/
wget https://bootstrap.pypa.io/get-pip.py
sleep 2
echo "${VERDE}"
python3 get-pip.py
sleep 2
apt install python3-twisted

sleep 2
apt install python3-bitarray

sleep 2
apt install python3-dev

sleep 2
echo "${CIAN}"
git clone https://github.com/lz5pn/HBlink3

sleep 2
mv /opt/HBlink3/ /opt/backup/
mv /opt/backup/HBlink3/ /opt/
mv /opt/backup/HBmonitor/ /opt/

sleep 2
chmod +x -R /opt/HBmonitor

sleep 2
sudo mv /opt/backup/dmr_utils3/ /opt/
sudo rm -r /opt/backup/

sleep 2
echo "${AMARILLO}"
cd /opt/dmr_utils3
chmod +x install.sh

sleep 2
./install.sh

sleep 2
/usr/bin/python3 -m pip install --upgrade pip

sleep 2
echo "${MARRON}"
pip install --upgrade dmr_utils3

sleep 2
cd /opt/HBlink3
cp hblink-SAMPLE.cfg hblink.cfg

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

sleep 2
echo "${BLANCO}"
sudo systemctl daemon-reload
sudo systemctl enable hblink

sleep 2
#Instalar Parrot para  Echotest:
chmod +x playback.py

sleep 2
#Crear directorio  /var/log/hblink si no está creado
mkdir /var/log/hblink

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

sleep 2
echo "${VERDE}"
systemctl enable parrot.service
#systemctl start parrot.service
#sudo systemctl status parrot.service

sleep 2
#Configurar HBlink
#nano /opt/HBlink3/hblink.cfg
#nano /opt/HBlink3/rules.py

sleep 2
#Test de configuración:
python3 /opt/HBlink3/bridge.py

#Si es ok salir con  "ctrl-c" y start los servicios



sleep 2
#Instalar web monitor para HBLink.
cd /opt/HBmonitor
chmod +x install.sh

sleep 2
echo "${AMARILLO}"
./install.sh

sleep 2
cp config_SAMPLE.py config.py

sleep 2
#Start monitor service:
cp utils/hbmon.service /lib/systemd/system/

sleep 2
systemctl enable hbmon
systemctl start parrot.service & systemctl start hbmon & systemctl start hblink & 
#sudo systemctl status hblink
#systemctl status hbmon
clear
echo "${ROJO}"
echo "********* FIN *****"
echo "********* FIN *****"
echo "********* FIN *****"
echo "********* FIN *****"
echo "********* FIN *****"
echo "********* FIN *****"
echo ""
echo "********** SE REINICIARA EL SISTEMA EN 5 SEGUNDOS ***********"
echo "********** SE REINICIARA EL SISTEMA EN 5 SEGUNDOS ***********"
echo "********** SE REINICIARA EL SISTEMA EN 5 SEGUNDOS ***********"
echo "********** SE REINICIARA EL SISTEMA EN 5 SEGUNDOS ***********"
echo "********** SE REINICIARA EL SISTEMA EN 5 SEGUNDOS ***********"
sleep 5
reboot
