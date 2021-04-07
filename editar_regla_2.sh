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
                        echo "                             EDITANDO REGLA Y PEER UNO                          "
                        echo "********************************************************************************"
                        echo "********************************************************************************"

                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""

						#echo "Indicativo tg conexión y tg desconexión Reflector"
						echo "${VERDE}Introduce indicativo  ej: EA3EIZ "
						read ind
                        if [ $id == ""] then

                        else
                        sudo sed -i "1c $ind" /opt/HBlink3/rules.py
                        fi
                        echo "${AMARILLO}Introduce TGID ej: 4373 "
						read tgid
                        echo "${BLANCO}Introduce tg conexión ej: 4373 "
						read tgc
                        echo "${CIAN}Introduce tg de desconexión ej: 84373"
                        read tgd
                        echo "${MARRON}Introduce reflector ej: DMR+4373"
                        read ref

sudo sed -i "40c ]," /opt/HBlink3/rules.py
sudo sed -i "41c '$ref': [ " /opt/HBlink3/rules.py                        
sudo sed -i "42c {'SYSTEM': '$ind', 'TS': 2, 'TGID': $tgid, 'ACTIVE': False, 'TIMEOUT': 10, 'TO_TYPE': 'ON',  'ON': [$tgc], 'OFF': [$tgd], 'RESET': []}," /opt/HBlink3/rules.py
sudo sed -i "43c {'SYSTEM': '$ref', 'TS': 2, 'TGID': 9, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py

                        sudo sed -i "220c [$ref] " /opt/HBlink3/hblink.cfg # no tocar 
                        sudo sed -i "221c MODE: PEER" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "222c ENABLED: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "223c LOOSE: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "224c EXPORT_AMBE: False" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "225c IP: " /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "226c PORT: 54002" /opt/HBlink3/hblink.cfg # #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 54002
                        echo "${VERDE}Introduce Address  ej: Brandmeister = master.spain-dmr.es / DMR+= 212.237.3.141 "
						read address
                        sudo sed -i "227c MASTER_IP: $address" /opt/HBlink3/hblink.cfg

						echo "${AMARILLO}Introduce puerto  ej: Brandmeister= 62031 / DMR+= 55555 "
						read puerto
                        sudo sed -i "228c MASTER_PORT: $puerto" /opt/HBlink3/hblink.cfg

                        sudo sed -i "229c PASSPHRASE:" /opt/HBlink3/hblink.cfg #no tocar

                        sudo sed -i "230c CALLSIGN: $ind" /opt/HBlink3/hblink.cfg #no tocar

						echo "${CIAN}Introduce indicativo  ej: 214317502 9 dígitos " #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 89 = 02
						read id
                        sudo sed -i "231c RADIO_ID: $id" /opt/HBlink3/hblink.cfg

						echo "${MARRON}Introduce RXfrecuencia  ej: 9 dígitos sin punto "
						read rxf
                        sudo sed -i "232c RX_FREQ: $rxf" /opt/HBlink3/hblink.cfg

						echo "${VERDE}Introduce TXfrecuencia  ej: 9 dígitos sin punto "
						read txf
                        sudo sed -i "233c TX_FREQ: $txf" /opt/HBlink3/hblink.cfg

                        sudo sed -i "234c TX_POWER: 25" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "235c COLORCODE: 1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "236c SLOTS: 2" /opt/HBlink3/hblink.cfg #no tocar

						echo "${AMARILLO}Introduce Latitud  ej: 4x.xxxxxx"
						read lat
                        sudo sed -i "237c LATITUDE: $lat" /opt/HBlink3/hblink.cfg

						echo "${BLANCO}Introduce Longitud  ej: 2.xxxxxx"
						read lon
                        sudo sed -i "238c LONGITUDE: $lon" /opt/HBlink3/hblink.cfg

                        sudo sed -i "239c HEIGHT: 209" /opt/HBlink3/hblink.cfg #no tocar

						echo "${CIAN}Introduce tu Ciudad"
						read ciudad
                        sudo sed -i "240c LOCATION: $ciudad" /opt/HBlink3/hblink.cfg

                        sudo sed -i "241c DESCRIPTION: This is a cool Hotspot" /opt/HBlink3/hblink.cfg #no tocar

						echo "${MARRON}Introduce tu URL preferida"
						read url
                        sudo sed -i "242c URL: $url" /opt/HBlink3/hblink.cfg

                        sudo sed -i "243c SOFTWARE_ID: 20191001" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "244c PACKAGE_ID: HBLLINK RASPI" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "245c GROUP_HANGTIME: 5" /opt/HBlink3/hblink.cfg #no tocar

						echo "${VERDE}Introduce Options ej: Brandmeister = #Options / DMR+ = StartRef=4370;RelinkTime=15; "
						read options
                        sudo sed -i "246c OPTIONS: $options" /opt/HBlink3/hblink.cfg

                        sudo sed -i "247c USE_ACL: True" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "248c REG_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "249c SUB_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "250c TGID_TS1_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "251c TGID_TS2_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
