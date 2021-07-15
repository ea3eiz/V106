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

                        #Quita los caracteres [] de la linea 153 [MASTER] Y lo carga en la variable $master como: MASTER
                        master=$(awk "NR==153" /opt/HBlink3/hblink.cfg)
                        var=`expr substr $master 2 20`
                        master=${var%]}
                                                
						echo "${VERDE}Configura tu indicativo  ej: EA3EIZ "
						read ind
                        ind=`echo "$ind" | tr [:lower:] [:upper:]`
                        echo "$ind" 
                        echo "${CIAN}Introduce Id obligatorio de 7 dígitos"
						read id
                        echo "${MARRON}Configura el Nombre que le darás a tu Conexión ej: Rule10_XLX266-Z"
                        read ref                        
                        sudo sed -i "1031c RADIO_ID: $id" /opt/HBlink3/hblink.cfg                      
                        echo "${AMARILLO}Configura el TG que utilizarás para transmitir ej: 4026"
						read tgid                        
                        echo "Configura el TG por el que quieres que salga tu transmisión ej: valor óptimo = 9 "
						read tgidsalir
                        echo "${BLANCO}Configura el número que utilizarás para conectarte a esta Regla ej: 4026 "
						read tgc
                        echo "Configura el número que utilizarás para desconectarte de esta Regla ej: 84026"
                        read tgd

sudo sed -i "120c ]," /opt/HBlink3/rules.py
sudo sed -i "121c '$ref': [ " /opt/HBlink3/rules.py                        
sudo sed -i "122c {'SYSTEM': '$master', 'TS': 2, 'TGID': $tgid, 'ACTIVE': False, 'TIMEOUT': 10, 'TO_TYPE': 'ON',  'ON': [$tgc], 'OFF': [$tgd], 'RESET': []}," /opt/HBlink3/rules.py
sudo sed -i "123c {'SYSTEM': '$ref', 'TS': 2, 'TGID': $tgid, 'ACTIVE': True, 'TIMEOUT': 10, 'TO_TYPE': 'NONE',  'ON': [$tgid], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py
sudo sed -i "124c {'SYSTEM': '$ref', 'TS': 2, 'TGID': $tgidsalir, 'ACTIVE': True, 'TIMEOUT': 10, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py
                        sudo sed -i "1020c [$ref] " /opt/HBlink3/hblink.cfg # no tocar 
                        sudo sed -i "1021c MODE: PEER" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "1022c ENABLED: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "1023c LOOSE: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "1024c EXPORT_AMBE: False" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "1025c IP: " /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "1026c PORT: 54010" /opt/HBlink3/hblink.cfg # #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 54010 
                        echo "${VERDE}Introduce Address del XLX "
						read address
                        sudo sed -i "1027c MASTER_IP: $address" /opt/HBlink3/hblink.cfg
						echo "${AMARILLO}Introduce puerto  ej: Valor óptimo = 62030"
						read puerto
                        echo "${AMARILLO}Introduce PASSWORD ej: valor óptimo = PASSWORD"
						read password 
                        sudo sed -i "1028c MASTER_PORT: $puerto" /opt/HBlink3/hblink.cfg
                        sudo sed -i "1029c PASSPHRASE: $password" /opt/HBlink3/hblink.cfg
                        sudo sed -i "1030c CALLSIGN: $ind" /opt/HBlink3/hblink.cfg #no tocar
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
                        sudo sed -i "1044c PACKAGE_ID: HBLINK_V106" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1045c GROUP_HANGTIME: 5" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1046c OPTIONS: " /opt/HBlink3/hblink.cfg
                        sudo sed -i "1047c USE_ACL: True" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1048c REG_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1049c SUB_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1050c TGID_TS1_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "1051c TGID_TS2_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "30c 2" /home/pi/info.ini # #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO 30
                        clear
                        echo "\v\v\v${VERDE}"
                        echo "********************************************************************************"
                        echo "********************************************************************************"
                        echo "       YA PUEDES ABRIR EL DASHBOARD PARA VER  LA CONEXIÓN QUE HAS CREADO        "
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
