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

                        echo "\v\v\v\v\v\v"
                        echo "${VERDE}"
                        echo "********************************************************************************"
                        echo "********************************************************************************"
                        echo "                             EDITANDO REGLA Y PEER 5                           "
                        echo "********************************************************************************"
                        echo "********************************************************************************"

                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""

						#echo "Indicativo tg conexión y tg desconexión Reflector"
						echo "${VERDE}Introduce indicativo  ej: EA3EIZ "
						read ind
                        echo "${AMARILLO}Introduce PASSWORD ej: passw0rd, PASSWORD, password selfcare etc."
						read password                         
                        echo "${AMARILLO}Introduce TGID ej: 4375 "
						read tgid                        
                        echo "${AMARILLO}Introduce TGID por el que quieras salir ej: 214"
						read tgidsalir
                        echo "${BLANCO}Introduce tg conexión ej: 4375 "
						read tgc
                        echo "${CIAN}Introduce tg de desconexión ej: 84375"
                        read tgd
                        echo "${MARRON}Introduce reflector ej: DMR+4375"
                        read ref

sudo sed -i "70c ]," /opt/HBlink3/rules.py
sudo sed -i "71c '$ref': [ " /opt/HBlink3/rules.py                        
sudo sed -i "72c {'SYSTEM': '$ind', 'TS': 2, 'TGID': $tgid, 'ACTIVE': False, 'TIMEOUT': 10, 'TO_TYPE': 'ON',  'ON': [$tgc], 'OFF': [$tgd], 'RESET': []}," /opt/HBlink3/rules.py
sudo sed -i "73c {'SYSTEM': '$ref', 'TS': 2, 'TGID': $tgidsalir, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py

                        sudo sed -i "520c [$ref] " /opt/HBlink3/hblink.cfg # no tocar 
                        sudo sed -i "521c MODE: PEER" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "522c ENABLED: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "523c LOOSE: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "524c EXPORT_AMBE: False" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "525c IP: " /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "526c PORT: 54005" /opt/HBlink3/hblink.cfg # #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 54002
                        echo "${VERDE}Introduce Address  ej: Brandmeister = master.spain-dmr.es / DMR+= 212.237.3.141 "
						read address
                        sudo sed -i "527c MASTER_IP: $address" /opt/HBlink3/hblink.cfg
						echo "${AMARILLO}Introduce puerto  ej: Brandmeister= 62031 / DMR+= 55555 "
						read puerto
                        sudo sed -i "528c MASTER_PORT: $puerto" /opt/HBlink3/hblink.cfg
                        sudo sed -i "529c PASSPHRASE: $password" /opt/HBlink3/hblink.cfg
                        sudo sed -i "530c CALLSIGN: $ind" /opt/HBlink3/hblink.cfg #no tocar
						echo "${CIAN}Introduce Id  ej: 214317505 9 dígitos " #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 89 = 02
						read id
                        sudo sed -i "531c RADIO_ID: $id" /opt/HBlink3/hblink.cfg
						echo "${MARRON}Introduce RXfrecuencia  ej: 9 dígitos sin punto "
						read rxf
                        sudo sed -i "532c RX_FREQ: $rxf" /opt/HBlink3/hblink.cfg
						echo "${VERDE}Introduce TXfrecuencia  ej: 9 dígitos sin punto "
						read txf
                        sudo sed -i "533c TX_FREQ: $txf" /opt/HBlink3/hblink.cfg
                        sudo sed -i "534c TX_POWER: 25" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "535c COLORCODE: 1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "536c SLOTS: 2" /opt/HBlink3/hblink.cfg #no tocar
						echo "${AMARILLO}Introduce Latitud  ej: 4x.xxxxxx"
						read lat
                        sudo sed -i "537c LATITUDE: $lat" /opt/HBlink3/hblink.cfg
						echo "${BLANCO}Introduce Longitud  ej: 2.xxxxxx"
						read lon
                        sudo sed -i "538c LONGITUDE: $lon" /opt/HBlink3/hblink.cfg
                        sudo sed -i "539c HEIGHT: 209" /opt/HBlink3/hblink.cfg #no tocar
						echo "${CIAN}Introduce tu Ciudad"
						read ciudad
                        sudo sed -i "540c LOCATION: $ciudad" /opt/HBlink3/hblink.cfg
                        sudo sed -i "541c DESCRIPTION: This is a cool Hotspot" /opt/HBlink3/hblink.cfg #no tocar
						echo "${MARRON}Introduce tu URL preferida"
						read url
                        sudo sed -i "542c URL: $url" /opt/HBlink3/hblink.cfg
                        sudo sed -i "543c SOFTWARE_ID: 20191001" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "544c PACKAGE_ID: HBLLINK RASPI" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "545c GROUP_HANGTIME: 5" /opt/HBlink3/hblink.cfg #no tocar
						echo "${VERDE}Introduce Options ej: Brandmeister = #Options / DMR+ = StartRef=4370;RelinkTime=15; "
						read options
                        sudo sed -i "546c OPTIONS: $options" /opt/HBlink3/hblink.cfg
                        sudo sed -i "547c USE_ACL: True" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "548c REG_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "549c SUB_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "550c TGID_TS1_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "551c TGID_TS2_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
