#!/bin/bash
clear
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"
echo "${VERDE}"
echo "********************************************************************************"
echo "********************************************************************************"
echo "                             EDITANDO MASTER PRIVADO                          "
echo "********************************************************************************"
echo "********************************************************************************"
actualizar=S
case $actualizar in
[sSyY]* ) echo ""

master=$(awk "NR==30" /home/pi/.local/regla2)
enable=$(awk "NR==32" /home/pi/.local/regla2)
port=$(awk "NR==31" /home/pi/.local/regla2) #nombre de la regla ej: DMR+4370
password=$(awk "NR==33" /home/pi/.local/regla2) #TG que utilizarás para transmitir ej: 437X


sudo sed -i "270c [$master] " /opt/HBlink3/hblink.cfg
sudo sed -i "271c MODE: MASTER" /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "272c ENABLED: $enable" /opt/HBlink3/hblink.cfg 
sudo sed -i "273c REPEAT: True" /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "274c MAX_PEERS: 10" /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "275c EXPORT_AMBE: " /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "276c IP: " /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "277c PORT: $port" /opt/HBlink3/hblink.cfg
sudo sed -i "278c PASSPHRASE: $password" /opt/HBlink3/hblink.cfg
sudo sed -i "279c GROUP_HANGTIME: 5" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "280c USE_ACL: True" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "281c REG_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "282c SUB_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "283c TGID_TS1_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "284c TGID_TS2_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
clear
echo "\v\v\v${VERDE}"
echo "********************************************************************************"
echo "********************************************************************************"
echo "                YA PUEDES ABRIR EL DASHBOARD PARA VISUALIZAR                    "
echo "                      EL MASTER SE HA CREADO CON EXITO                          "
echo "               ESTE PROCESO TARDARÁ UNOS SEGUNDOS SEA PACIENTE!!                "
echo "********************************************************************************"
echo "********************************************************************************"                        
sudo systemctl restart hbmon
sudo systemctl restart hblink
sleep 10
break;;
[Nn]* ) echo ""
clear
break;;
esac
