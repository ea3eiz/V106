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
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                             EDITANDO REGLA Y PEER UNO                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"

                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""

						#echo "Indicativo tg conexión y tg desconexión Reflector"
						echo "Introduce indicativo  ej: EA3EIZ "
						read ind
                        echo "Introduce TGID conexión ej: 4373 "
						read tgid
                        echo "Introduce tg conexión ej: 4373 "
						read tgc
                        echo "Introduce tg de desconexión ej: 84373"
                        read tgd
                        echo "Introduce reflector ej: DMR+4373"
                        read ref

sudo sed -i "40c ]," /opt/HBlink3/rules.py
sudo sed -i "41c '$ref': [ " /opt/HBlink3/rules.py                        
sudo sed -i "42c {'SYSTEM': '$ind', 'TS': 2, 'TGID': $tgid, 'ACTIVE': False, 'TIMEOUT': 10, 'TO_TYPE': 'ON',  'ON': [$tgc], 'OFF': [$tgd], 'RESET': []}," /opt/HBlink3/rules.py
sudo sed -i "43c {'SYSTEM': '$ref', 'TS': 2, 'TGID': 9, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py

                        sudo sed -i "220c [$ref] " /opt/HBlink3/hblink.cfg 
                        sudo sed -i "221c MODE: PEER" /opt/HBlink3/hblink.cfg
                        sudo sed -i "222c ENABLED: True" /opt/HBlink3/hblink.cfg
                        sudo sed -i "223c LOOSE: True" /opt/HBlink3/hblink.cfg
                        sudo sed -i "224c EXPORT_AMBE: False" /opt/HBlink3/hblink.cfg
                        sudo sed -i "225c IP: " /opt/HBlink3/hblink.cfg
                        sudo sed -i "226c PORT: 54002" /opt/HBlink3/hblink.cfg
                        sudo sed -i "227c MASTER_IP: 212.237.3.141" /opt/HBlink3/hblink.cfg
                        sudo sed -i "228c MASTER_PORT: 55555" /opt/HBlink3/hblink.cfg
                        sudo sed -i "229c PASSPHRASE: ea3eiz-ADER" /opt/HBlink3/hblink.cfg
                        sudo sed -i "230c CALLSIGN: EA3EIZ" /opt/HBlink3/hblink.cfg
                        sudo sed -i "231c RADIO_ID: 2143175" /opt/HBlink3/hblink.cfg
                        sudo sed -i "232c RX_FREQ: 436000000" /opt/HBlink3/hblink.cfg
                        sudo sed -i "233c TX_FREQ: 436000000" /opt/HBlink3/hblink.cfg
                        sudo sed -i "234c TX_POWER: 25" /opt/HBlink3/hblink.cfg
                        sudo sed -i "235c COLORCODE: 1" /opt/HBlink3/hblink.cfg
                        sudo sed -i "236c SLOTS: 2" /opt/HBlink3/hblink.cfg
                        sudo sed -i "237c LATITUDE: 41.530704" /opt/HBlink3/hblink.cfg
                        sudo sed -i "238c LONGITUDE: 2.185437" /opt/HBlink3/hblink.cfg
                        sudo sed -i "239c HEIGHT: 209" /opt/HBlink3/hblink.cfg
                        sudo sed -i "240c LOCATION: Barcelona, SPAIN" /opt/HBlink3/hblink.cfg
                        sudo sed -i "241c DESCRIPTION: This is a cool Hotspot" /opt/HBlink3/hblink.cfg
                        sudo sed -i "242c URL: www.associacioADER.com" /opt/HBlink3/hblink.cfg
                        sudo sed -i "243c SOFTWARE_ID: 20191001" /opt/HBlink3/hblink.cfg
                        sudo sed -i "244c PACKAGE_ID: HBLLINK RASPI" /opt/HBlink3/hblink.cfg
                        sudo sed -i "245c GROUP_HANGTIME: 5" /opt/HBlink3/hblink.cfg
                        sudo sed -i "246c OPTIONS: StartRef=4370;RelinkTime=15;" /opt/HBlink3/hblink.cfg
                        sudo sed -i "247c USE_ACL: True" /opt/HBlink3/hblink.cfg
                        sudo sed -i "248c REG_ACL: DENY:1" /opt/HBlink3/hblink.cfg
                        sudo sed -i "249c SUB_ACL: DENY:1" /opt/HBlink3/hblink.cfg
                        sudo sed -i "250c TGID_TS1_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg
                        sudo sed -i "251c TGID_TS2_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
