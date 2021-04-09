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
                        echo "                             EDITANDO REGLA Y PEER 8                            "
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
                        echo "${AMARILLO}Introduce TGID ej: 4378 "
						read tgid                        
                        echo "${AMARILLO}Introduce TGID por el que quieras salir ej: 214"
						read tgidsalir
                        echo "${BLANCO}Introduce tg conexión ej: 4378 "
						read tgc
                        echo "${CIAN}Introduce tg de desconexión ej: 84378"
                        read tgd
                        echo "${MARRON}Introduce reflector ej: DMR+4378"
                        read ref

sudo sed -i "100c ]," /opt/HBlink3/rules.py
sudo sed -i "101c '$ref': [ " /opt/HBlink3/rules.py                        
sudo sed -i "102c {'SYSTEM': '$ind', 'TS': 2, 'TGID': $tgid, 'ACTIVE': False, 'TIMEOUT': 10, 'TO_TYPE': 'ON',  'ON': [$tgc], 'OFF': [$tgd], 'RESET': []}," /opt/HBlink3/rules.py
sudo sed -i "103c {'SYSTEM': '$ref', 'TS': 2, 'TGID': $tgidsalir, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py

                        sudo sed -i "820c [$ref] " /opt/HBlink3/hblink.cfg # no tocar 
                        sudo sed -i "821c MODE: PEER" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "822c ENABLED: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "823c LOOSE: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "824c EXPORT_AMBE: False" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "825c IP: " /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "826c PORT: 54008" /opt/HBlink3/hblink.cfg # #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 54002
                        echo "${VERDE}Introduce Address  ej: Brandmeister = master.spain-dmr.es / DMR+= 212.237.3.141 "
						read address
                        sudo sed -i "827c MASTER_IP: $address" /opt/HBlink3/hblink.cfg
						echo "${AMARILLO}Introduce puerto  ej: Brandmeister= 62031 / DMR+= 55555 "
						read puerto
                        sudo sed -i "828c MASTER_PORT: $puerto" /opt/HBlink3/hblink.cfg
                        sudo sed -i "829c PASSPHRASE: $password" /opt/HBlink3/hblink.cfg
                        sudo sed -i "830c CALLSIGN: $ind" /opt/HBlink3/hblink.cfg #no tocar
						echo "${CIAN}Introduce Id ej: 214317508 9 dígitos " #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 89 = 02
						read id
                        sudo sed -i "831c RADIO_ID: $id" /opt/HBlink3/hblink.cfg
						echo "${MARRON}Introduce RXfrecuencia  ej: 9 dígitos sin punto "
						read rxf
                        sudo sed -i "832c RX_FREQ: $rxf" /opt/HBlink3/hblink.cfg
						echo "${VERDE}Introduce TXfrecuencia  ej: 9 dígitos sin punto "
						read txf
                        sudo sed -i "833c TX_FREQ: $txf" /opt/HBlink3/hblink.cfg
                        sudo sed -i "834c TX_POWER: 25" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "835c COLORCODE: 1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "836c SLOTS: 2" /opt/HBlink3/hblink.cfg #no tocar
						echo "${AMARILLO}Introduce Latitud  ej: 4x.xxxxxx"
						read lat
                        sudo sed -i "837c LATITUDE: $lat" /opt/HBlink3/hblink.cfg
						echo "${BLANCO}Introduce Longitud  ej: 2.xxxxxx"
						read lon
                        sudo sed -i "838c LONGITUDE: $lon" /opt/HBlink3/hblink.cfg
                        sudo sed -i "839c HEIGHT: 209" /opt/HBlink3/hblink.cfg #no tocar
						echo "${CIAN}Introduce tu Ciudad"
						read ciudad
                        sudo sed -i "840c LOCATION: $ciudad" /opt/HBlink3/hblink.cfg
                        sudo sed -i "841c DESCRIPTION: This is a cool Hotspot" /opt/HBlink3/hblink.cfg #no tocar
						echo "${MARRON}Introduce tu URL preferida"
						read url
                        sudo sed -i "842c URL: $url" /opt/HBlink3/hblink.cfg
                        sudo sed -i "843c SOFTWARE_ID: 20191001" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "844c PACKAGE_ID: HBLLINK RASPI" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "845c GROUP_HANGTIME: 5" /opt/HBlink3/hblink.cfg #no tocar
						echo "${VERDE}Introduce Options ej: Brandmeister = #Options / DMR+ = StartRef=4370;RelinkTime=15; "
						read options
                        sudo sed -i "846c OPTIONS: $options" /opt/HBlink3/hblink.cfg
                        sudo sed -i "847c USE_ACL: True" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "848c REG_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "849c SUB_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "850c TGID_TS1_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "851c TGID_TS2_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
