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
                        echo "                             EDITANDO REGLA Y PEER 9                            "
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
                        echo "${AMARILLO}Introduce TGID ej: 4379 "
						read tgid                        
                        echo "${AMARILLO}Introduce TGID por el que quieras salir ej: 214"
						read tgidsalir
                        echo "${BLANCO}Introduce tg conexión ej: 4379 "
						read tgc
                        echo "${CIAN}Introduce tg de desconexión ej: 84379"
                        read tgd
                        echo "${MARRON}Introduce reflector ej: DMR+4379"
                        read ref

sudo sed -i "110c ]," /opt/HBlink3/rules.py
sudo sed -i "111c '$ref': [ " /opt/HBlink3/rules.py                        
sudo sed -i "112c {'SYSTEM': '$ind', 'TS': 2, 'TGID': $tgid, 'ACTIVE': False, 'TIMEOUT': 10, 'TO_TYPE': 'ON',  'ON': [$tgc], 'OFF': [$tgd], 'RESET': []}," /opt/HBlink3/rules.py
sudo sed -i "113c {'SYSTEM': '$ref', 'TS': 2, 'TGID': $tgidsalir, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py

                        sudo sed -i "920c [$ref] " /opt/HBlink3/hblink.cfg # no tocar 
                        sudo sed -i "921c MODE: PEER" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "922c ENABLED: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "923c LOOSE: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "924c EXPORT_AMBE: False" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "925c IP: " /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "926c PORT: 54009" /opt/HBlink3/hblink.cfg # #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 54002
                        echo "${VERDE}Introduce Address  ej: Brandmeister = master.spain-dmr.es / DMR+= 212.237.3.141 "
						read address
                        sudo sed -i "927c MASTER_IP: $address" /opt/HBlink3/hblink.cfg
						echo "${AMARILLO}Introduce puerto  ej: Brandmeister= 62031 / DMR+= 55555 "
						read puerto
                        sudo sed -i "928c MASTER_PORT: $puerto" /opt/HBlink3/hblink.cfg
                        sudo sed -i "929c PASSPHRASE: $password" /opt/HBlink3/hblink.cfg
                        sudo sed -i "930c CALLSIGN: $ind" /opt/HBlink3/hblink.cfg #no tocar
						echo "${CIAN}Introduce Id ej: 214317509 9 dígitos " #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 89 = 02
						read id
                        sudo sed -i "931c RADIO_ID: $id" /opt/HBlink3/hblink.cfg
						echo "${MARRON}Introduce RXfrecuencia  ej: 9 dígitos sin punto "
						read rxf
                        sudo sed -i "932c RX_FREQ: $rxf" /opt/HBlink3/hblink.cfg
						echo "${VERDE}Introduce TXfrecuencia  ej: 9 dígitos sin punto "
						read txf
                        sudo sed -i "933c TX_FREQ: $txf" /opt/HBlink3/hblink.cfg
                        sudo sed -i "934c TX_POWER: 25" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "935c COLORCODE: 1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "936c SLOTS: 2" /opt/HBlink3/hblink.cfg #no tocar
						echo "${AMARILLO}Introduce Latitud  ej: 4x.xxxxxx"
						read lat
                        sudo sed -i "937c LATITUDE: $lat" /opt/HBlink3/hblink.cfg
						echo "${BLANCO}Introduce Longitud  ej: 2.xxxxxx"
						read lon
                        sudo sed -i "938c LONGITUDE: $lon" /opt/HBlink3/hblink.cfg
                        sudo sed -i "939c HEIGHT: 209" /opt/HBlink3/hblink.cfg #no tocar
						echo "${CIAN}Introduce tu Ciudad"
						read ciudad
                        sudo sed -i "940c LOCATION: $ciudad" /opt/HBlink3/hblink.cfg
                        sudo sed -i "941c DESCRIPTION: This is a cool Hotspot" /opt/HBlink3/hblink.cfg #no tocar
						echo "${MARRON}Introduce tu URL preferida"
						read url
                        sudo sed -i "942c URL: $url" /opt/HBlink3/hblink.cfg
                        sudo sed -i "943c SOFTWARE_ID: 20191001" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "944c PACKAGE_ID: HBLLINK RASPI" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "945c GROUP_HANGTIME: 5" /opt/HBlink3/hblink.cfg #no tocar
						echo "${VERDE}Introduce Options ej: Brandmeister = #Options / DMR+ = StartRef=4370;RelinkTime=15; "
						read options
                        sudo sed -i "946c OPTIONS: $options" /opt/HBlink3/hblink.cfg
                        sudo sed -i "947c USE_ACL: True" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "948c REG_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "949c SUB_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "950c TGID_TS1_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "951c TGID_TS2_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
