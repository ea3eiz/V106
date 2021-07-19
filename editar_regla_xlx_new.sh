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
echo "                             EDITANDO REGLA Y PEER XLX                            "
echo "********************************************************************************"
echo "********************************************************************************"
actualizar=S
case $actualizar in
[sSyY]* ) echo ""

master=$(awk "NR==1" /home/pi/.local/reglaxlx)
ind=$(awk "NR==2" /home/pi/.local/reglaxlx)
ref=$(awk "NR==4" /home/pi/.local/reglaxlx) #nombre de la regla ej: DMR+4370

ref=`echo "$ref" | tr -d '[[:space:]]'`

tgid=$(awk "NR==9" /home/pi/.local/reglaxlx) #TG que utilizarás para transmitir ej: 437X
tgidsalir=$(awk "NR==10" /home/pi/.local/reglaxlx) #TG por el que quieres que salga tu transmisión ej: DMR+ = 9 Brandmeister = tg por el que quieres salir
tgc=$(awk "NR==11" /home/pi/.local/reglaxlx) #TG que utilizas para conectar esta regla ej: 437x
tgd=$(awk "NR==12" /home/pi/.local/reglaxlx) #TG que utilizarás para desconectar esta Regla ej: 8437X

sudo sed -i "120c ]," /opt/HBlink3/rules.py
sudo sed -i "121c '$ref': [ " /opt/HBlink3/rules.py                        
sudo sed -i "122c {'SYSTEM': '$master', 'TS': 2, 'TGID': $tgid, 'ACTIVE': False, 'TIMEOUT': 10, 'TO_TYPE': 'ON',  'ON': [$tgc], 'OFF': [$tgd], 'RESET': []}," /opt/HBlink3/rules.py
sudo sed -i "123c {'SYSTEM': '$ref', 'TS': 2, 'TGID': $tgid, 'ACTIVE': True, 'TIMEOUT': 10, 'TO_TYPE': 'NONE',  'ON': [$tgid], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py
sudo sed -i "124c {'SYSTEM': '$ref', 'TS': 2, 'TGID': $tgidsalir, 'ACTIVE': True, 'TIMEOUT': 10, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py
                                                                                              
                     
sudo sed -i "110c ]," /opt/HBlink3/rules.py
sudo sed -i "111c '$ref': [ " /opt/HBlink3/rules.py 
sudo sed -i "113c {'SYSTEM': '$ref', 'TS': 2, 'TGID': $tgidsalir, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py


sudo sed -i "1020c [$ref] " /opt/HBlink3/hblink.cfg
sudo sed -i "1021c MODE: PEER" /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "1022c ENABLED: True" /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "1023c LOOSE: True" /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "1024c EXPORT_AMBE: False" /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "1025c IP: " /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "1026c PORT: 54010" /opt/HBlink3/hblink.cfg # #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 54004
address=$(awk "NR==5" /home/pi/.local/reglaxlx) #ip del reflector
sudo sed -i "1027c MASTER_IP: $address" /opt/HBlink3/hblink.cfg
puerto=$(awk "NR==6" /home/pi/.local/reglaxlx) #puerto ej: Brandmeister= 62031 / DMR+= 55555
sudo sed -i "1028c MASTER_PORT: $puerto" /opt/HBlink3/hblink.cfg
password=$(awk "NR==7" /home/pi/.local/reglaxlx) #password ej: passw0rd, PASSWORD, password selfcare etc.
sudo sed -i "1029c PASSPHRASE: $password" /opt/HBlink3/hblink.cfg
sudo sed -i "1030c CALLSIGN: $ind" /opt/HBlink3/hblink.cfg #no tocar
id=$(awk "NR==3" /home/pi/.local/reglaxlx) #9 dígitos
sudo sed -i "1031c RADIO_ID: $id" /opt/HBlink3/hblink.cfg
rxf=$(awk "NR==14" /home/pi/.local/reglaxlx) #la frecuencia de Recepción  ej: 9 dígitos sin punto
sudo sed -i "1032c RX_FREQ: $rxf" /opt/HBlink3/hblink.cfg
txf=$(awk "NR==15" /home/pi/.local/reglaxlx) #la Frecuencia  Emisión  ej: 9 dígitos sin punto
sudo sed -i "1033c TX_FREQ: $txf" /opt/HBlink3/hblink.cfg
sudo sed -i "1034c TX_POWER: 25" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "1035c COLORCODE: 1" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "1036c SLOTS: 2" /opt/HBlink3/hblink.cfg #no tocar
lat=$(awk "NR==16" /home/pi/.local/reglaxlx) #tu Latitud ej: 4x.xxxxxx
sudo sed -i "1037c LATITUDE: $lat" /opt/HBlink3/hblink.cfg
lon=$(awk "NR==17" /home/pi/.local/reglaxlx) #tu Longitud  ej: 2.xxxxxx
sudo sed -i "1038c LONGITUDE: $lon" /opt/HBlink3/hblink.cfg
sudo sed -i "1039c HEIGHT: 209" /opt/HBlink3/hblink.cfg #no tocar
ciudad=$(awk "NR==18" /home/pi/.local/reglaxlx) #tu Ciudad ej: Barcelona
sudo sed -i "1040c LOCATION: $ciudad" /opt/HBlink3/hblink.cfg
url=$(awk "NR==19" /home/pi/.local/reglaxlx) #tu URL preferida ej: www.associacioader.com
sudo sed -i "1041c DESCRIPTION: This is a cool Hotspot" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "1042c URL: $url" /opt/HBlink3/hblink.cfg						                        
sudo sed -i "1043c SOFTWARE_ID: 20191001" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "1044c PACKAGE_ID: HBLINK_V106" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "1045c GROUP_HANGTIME: 5" /opt/HBlink3/hblink.cfg #no tocar
options=$(awk "NR==8" /home/pi/.local/reglaxlx) #Options ej: Brandmeister = #Options / DMR+ ej: StartRef=437X;RelinkTime=15;
sudo sed -i "1046c OPTIONS: $options" /opt/HBlink3/hblink.cfg
sudo sed -i "1047c USE_ACL: True" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "1048c REG_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "1049c SUB_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "1050c TGID_TS1_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "1051c TGID_TS2_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "30c 2" /home/pi/info.ini # #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO 24

clear
echo "\v\v\v${VERDE}"
echo "********************************************************************************"
echo "********************************************************************************"
echo "                YA PUEDES ABRIR EL DASHBOARD PARA VISUALIZAR                    "
echo "                    LA CONEXIOÓN QUE HAS CREADO ó EDITADO                       "
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
