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
echo "                             EDITANDO REGLA Y PEER 5                            "
echo "********************************************************************************"
echo "********************************************************************************"
actualizar=S
case $actualizar in
[sSyY]* ) echo ""

master=$(awk "NR==1" /home/pi/.local/regla5)
ind=$(awk "NR==2" /home/pi/.local/regla5)
ref=$(awk "NR==4" /home/pi/.local/regla5) #nombre de la regla ej: DMR+4370

ref=`echo "$ref" | tr -d '[[:space:]]'`

tgid=$(awk "NR==9" /home/pi/.local/regla5) #TG que utilizarás para transmitir ej: 437X
tgidsalir=$(awk "NR==10" /home/pi/.local/regla5) #TG por el que quieres que salga tu transmisión ej: DMR+ = 9 Brandmeister = tg por el que quieres salir
tgc=$(awk "NR==11" /home/pi/.local/regla5) #TG que utilizas para conectar esta regla ej: 437x
tgd=$(awk "NR==12" /home/pi/.local/regla5) #TG que utilizarás para desconectar esta Regla ej: 8437X

conexion=$(awk "NR==13" /home/pi/.local/regla5) # P para conexión Permanente  D para conexión a demanda (dura 10 minutos)                       
if [ $conexion = D ]
then
sudo sed -i "72c {'SYSTEM': '$master', 'TS': 2, 'TGID': $tgid, 'ACTIVE': False, 'TIMEOUT': 10, 'TO_TYPE': 'ON',  'ON': [$tgc], 'OFF': [$tgd], 'RESET': []}," /opt/HBlink3/rules.py # a demanda
else
sudo sed -i "72c {'SYSTEM': '$master', 'TS': 2, 'TGID': $tgid, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE', 'ON': [$tgc], 'OFF': [$tgd],'RESET': []}," /opt/HBlink3/rules.py # permanente                        
fi                                                                                             
                     
sudo sed -i "70c ]," /opt/HBlink3/rules.py
sudo sed -i "71c '$ref': [ " /opt/HBlink3/rules.py 
sudo sed -i "73c {'SYSTEM': '$ref', 'TS': 2, 'TGID': $tgidsalir, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py


sudo sed -i "520c [$ref] " /opt/HBlink3/hblink.cfg
sudo sed -i "521c MODE: PEER" /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "522c ENABLED: True" /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "523c LOOSE: True" /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "524c EXPORT_AMBE: False" /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "525c IP: " /opt/HBlink3/hblink.cfg # no tocar
sudo sed -i "526c PORT: 54005" /opt/HBlink3/hblink.cfg # #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 54004
address=$(awk "NR==5" /home/pi/.local/regla5) #ip del reflector
sudo sed -i "527c MASTER_IP: $address" /opt/HBlink3/hblink.cfg
puerto=$(awk "NR==6" /home/pi/.local/regla5) #puerto ej: Brandmeister= 62031 / DMR+= 55555
sudo sed -i "528c MASTER_PORT: $puerto" /opt/HBlink3/hblink.cfg
password=$(awk "NR==7" /home/pi/.local/regla5) #password ej: passw0rd, PASSWORD, password selfcare etc.
sudo sed -i "529c PASSPHRASE: $password" /opt/HBlink3/hblink.cfg
sudo sed -i "530c CALLSIGN: $ind" /opt/HBlink3/hblink.cfg #no tocar
id=$(awk "NR==3" /home/pi/.local/regla5) #9 dígitos
sudo sed -i "531c RADIO_ID: $id" /opt/HBlink3/hblink.cfg
rxf=$(awk "NR==14" /home/pi/.local/regla5) #la frecuencia de Recepción  ej: 9 dígitos sin punto
sudo sed -i "532c RX_FREQ: $rxf" /opt/HBlink3/hblink.cfg
txf=$(awk "NR==15" /home/pi/.local/regla5) #la Frecuencia  Emisión  ej: 9 dígitos sin punto
sudo sed -i "533c TX_FREQ: $txf" /opt/HBlink3/hblink.cfg
sudo sed -i "534c TX_POWER: 25" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "535c COLORCODE: 1" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "536c SLOTS: 2" /opt/HBlink3/hblink.cfg #no tocar
lat=$(awk "NR==16" /home/pi/.local/regla5) #tu Latitud ej: 4x.xxxxxx
sudo sed -i "537c LATITUDE: $lat" /opt/HBlink3/hblink.cfg
lon=$(awk "NR==17" /home/pi/.local/regla5) #tu Longitud  ej: 2.xxxxxx
sudo sed -i "538c LONGITUDE: $lon" /opt/HBlink3/hblink.cfg
sudo sed -i "539c HEIGHT: 209" /opt/HBlink3/hblink.cfg #no tocar
ciudad=$(awk "NR==18" /home/pi/.local/regla5) #tu Ciudad ej: Barcelona
sudo sed -i "540c LOCATION: $ciudad" /opt/HBlink3/hblink.cfg
url=$(awk "NR==19" /home/pi/.local/regla5) #tu URL preferida ej: www.associacioader.com
sudo sed -i "541c DESCRIPTION: This is a cool Hotspot" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "542c URL: $url" /opt/HBlink3/hblink.cfg						                        
sudo sed -i "543c SOFTWARE_ID: 20191001" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "544c PACKAGE_ID: HBLINK_V106" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "545c GROUP_HANGTIME: 5" /opt/HBlink3/hblink.cfg #no tocar
options=$(awk "NR==8" /home/pi/.local/regla5) #Options ej: Brandmeister = #Options / DMR+ ej: StartRef=437X;RelinkTime=15;
sudo sed -i "546c OPTIONS: $options" /opt/HBlink3/hblink.cfg
sudo sed -i "547c USE_ACL: True" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "548c REG_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "549c SUB_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "550c TGID_TS1_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "551c TGID_TS2_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
sudo sed -i "25c 2" /home/pi/info.ini # #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO 24

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
