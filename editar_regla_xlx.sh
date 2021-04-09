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
                        echo "                             EDITANDO REGLA Y PEER XLX                          "
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
                        echo "${AMARILLO}Introduce TGID ej: 4026 "
						read tgid                        
                        echo "${AMARILLO}Introduce TGID por el que quieras salir ej: 4026"
						read tgidsalir
                        echo "${BLANCO}Introduce tg conexión ej: 4026 "
						read tgc
                        echo "${CIAN}Introduce tg de desconexión ej: 84026"
                        read tgd
                        echo "${MARRON}Introduce reflector ej: XLX266-Z"
                        read ref

sudo sed -i "120c ]," /opt/HBlink3/rules.py
sudo sed -i "121c '$ref': [ " /opt/HBlink3/rules.py                        
sudo sed -i "122c {'SYSTEM': '$ind', 'TS': 2, 'TGID': $tgid, 'ACTIVE': False, 'TIMEOUT': 10, 'TO_TYPE': 'ON',  'ON': [$tgc], 'OFF': [$tgd], 'RESET': []}," /opt/HBlink3/rules.py
sudo sed -i "123c {'SYSTEM': '$ref', 'TS': 2, 'TGID': $tgid, 'ACTIVE': True, 'TIMEOUT': 10, 'TO_TYPE': 'NONE',  'ON': [$tgid], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py
sudo sed -i "124c {'SYSTEM': '$ref', 'TS': 2, 'TGID': $tgidsalir, 'ACTIVE': True, 'TIMEOUT': 10, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py

                        sudo sed -i "1020c [$ref] " /opt/HBlink3/hblink.cfg # no tocar 
                        sudo sed -i "1021c MODE: PEER" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "1022c ENABLED: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "1023c LOOSE: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "1024c EXPORT_AMBE: False" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "1025c IP: " /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "1026c PORT: 54002" /opt/HBlink3/hblink.cfg # #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 54002
                        echo "${VERDE}Introduce Address  ej: Brandmeister = master.spain-dmr.es / DMR+= 212.237.3.141 "
						read address
                        sudo sed -i "1027c MASTER_IP: $address" /opt/HBlink3/hblink.cfg
						echo "${AMARILLO}Introduce puerto  ej: Brandmeister= 62031 / DMR+= 55555 "
						read puerto
                        sudo sed -i "1028c MASTER_PORT: $puerto" /opt/HBlink3/hblink.cfg
                        sudo sed -i "1029c PASSPHRASE: $password" /opt/HBlink3/hblink.cfg
                        sudo sed -i "1030c CALLSIGN: $ind" /opt/HBlink3/hblink.cfg #no tocar
						echo "${CIAN}Introduce indicativo  ej: 214317502 9 dígitos " #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 89 = 02
						read id
                        sudo sed -i "1031c RADIO_ID: $id" /opt/HBlink3/hblink.cfg
						echo "${MARRON}Introduce RXfrecuencia  ej: 9 dígitos sin punto "
						read rxf
                        sudo sed -i "1032c RX_FREQ: $rxf" /opt/HBlink3/hblink.cfg
						echo "${VERDE}Introduce TXfrecuencia  ej: 9 dígitos sin punto "
						read txf
                        sudo sed -i "1033c TX_FREQ: $txf" /opt/HBlink3/hblink.cfg
                        sudo sed -i "1034c TX_POWER: 25" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1035c COLORCODE: 1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1036c SLOTS: 2" /opt/HBlink3/hblink.cfg #no tocar
						echo "${AMARILLO}Introduce Latitud  ej: 4x.xxxxxx"
						read lat
                        sudo sed -i "1037c LATITUDE: $lat" /opt/HBlink3/hblink.cfg
						echo "${BLANCO}Introduce Longitud  ej: 2.xxxxxx"
						read lon
                        sudo sed -i "1038c LONGITUDE: $lon" /opt/HBlink3/hblink.cfg
                        sudo sed -i "1039c HEIGHT: 209" /opt/HBlink3/hblink.cfg #no tocar
						echo "${CIAN}Introduce tu Ciudad"
						read ciudad
                        sudo sed -i "1040c LOCATION: $ciudad" /opt/HBlink3/hblink.cfg
                        sudo sed -i "1041c DESCRIPTION: This is a cool Hotspot" /opt/HBlink3/hblink.cfg #no tocar
						echo "${MARRON}Introduce tu URL preferida"
						read url
                        sudo sed -i "1042c URL: $url" /opt/HBlink3/hblink.cfg
                        sudo sed -i "1043c SOFTWARE_ID: 20191001" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1044c PACKAGE_ID: HBLLINK RASPI" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1045c GROUP_HANGTIME: 5" /opt/HBlink3/hblink.cfg #no tocar
						echo "${VERDE}Introduce Options ej: Brandmeister = #Options / DMR+ = StartRef=4370;RelinkTime=15; "
						read options
                        sudo sed -i "1046c OPTIONS: $options" /opt/HBlink3/hblink.cfg
                        sudo sed -i "1047c USE_ACL: True" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1048c REG_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1049c SUB_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1050c TGID_TS1_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1051c TGID_TS2_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac