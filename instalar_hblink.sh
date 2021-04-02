#!/bin/bash
sudo apt update
sudo apt install python3-distutils

cd /opt/
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
sudo apt install python3-twisted
sudo apt install python3-bitarray
sudo apt install python3-dev
git clone https://github.com/lz5pn/HBlink3
sudo mv /opt/HBlink3/ /opt/backup/
sudo mv /opt/backup/HBlink3/ /opt/
sudo mv /opt/backup/HBmonitor/ /opt/
sudo mv /opt/backup/dmr_utils3/ /opt/
sudo rm -r /opt/backup/

sleep2
cd /opt/dmr_utils3
sudo chmod +x install.sh
sudo ./install.sh
sudo /usr/bin/python3 -m pip install --upgrade pip
sudo pip install --upgrade dmr_utils3

sleep 2
cd /opt/HBlink3
sudo cp hblink-SAMPLE.cfg hblink.cfg
sudo cp rules-SAMPLE.py rules.py

#Autostart HBLink:
sudo cp /home/pi/V106/hblink.service /lib/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable hblink

#Instalar Parrot para  Echotest:
sudo chmod +x playback.py

#Crear directorio  /var/log/hblink si no está creado
sudo mkdir /var/log/hblink

#Crear servicio para el parrot /lib/systemd/system/parrot.service 
sudo cp /home/pi/V106/parrot.service /lib/systemd/system/

sudo systemctl enable parrot.service
sudo systemctl start parrot.service
#sudo systemctl status parrot.service

#Configurar HBlink
#sudo nano /opt/HBlink3/hblink.cfg
#sudo nano /opt/HBlink3/rules.py

#Test de configuración:
#python3 /opt/HBlink3/bridge.py

#Si es ok salir con  "ctrl-c" y start los servicios

sudo systemctl start hblink
#sudo systemctl status hblink

sleep 2
#Instalar web monitor para HBLink.
cd /opt/HBmonitor
sudo chmod +x install.sh
sudo ./install.sh
sudo cp config_SAMPLE.py config.py
#sudo nano /opt/HBmonitor/config.py

#Start monitor service:
sudo cp utils/hbmon.service /lib/systemd/system/
sudo systemctl enable hbmon
sudo systemctl start hbmon
#sudo systemctl status hbmon
clear
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
#reboot
