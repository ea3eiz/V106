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

                        #Quita los caracteres [] de la linea 153 [MASTER] Y lo carga en la variable $master como: MASTER
                        master=$(awk "NR==153" /opt/HBlink3/hblink.cfg)
                        var=`expr substr $master 2 20`
                        master=${var%]}
                                               
						echo "${VERDE}Configura tu indicativo  ej: EA3EIZ "
						read ind
                        ind=`echo "$ind" | tr [:lower:] [:upper:]`
                        echo "$ind"
                        echo "${CIAN}Configura tu Id ej: 214317505 9 dígitos " #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 8y9 = 05
						read id
                        sudo sed -i "531c RADIO_ID: $id" /opt/HBlink3/hblink.cfg
                        clear
                        echo "${BLANCO}*********************************************************************************"
                        echo ""                       
                        echo "${MARRON}Configura el Nombre que le darás a tu Conexión ej: Rule5_DMR+437X, Rule5_BM, Rule5_TGIF etc."
                        read ref
                        sudo sed -i "520c [$ref] " /opt/HBlink3/hblink.cfg
                        echo "${VERDE}Configura el Address del Servidor ej: Brandmeister = master.spain-dmr.es / DMR+= id del reflector "
						read address
                        sudo sed -i "527c MASTER_IP: $address" /opt/HBlink3/hblink.cfg
						echo "${AMARILLO}Configura el puerto ej: Brandmeister= 62031 / DMR+= 55555 "
						read puerto
                        sudo sed -i "528c MASTER_PORT: $puerto" /opt/HBlink3/hblink.cfg
                        echo "${AMARILLO}Configura el password ej: passw0rd, PASSWORD, password selfcare etc."                       
						read password 
                        sudo sed -i "529c PASSPHRASE: $password" /opt/HBlink3/hblink.cfg
						echo "${VERDE}Configura Options ej: Brandmeister = #Options / DMR+ ej: StartRef=437X;RelinkTime=15; "
						read options
                        sudo sed -i "546c OPTIONS: $options" /opt/HBlink3/hblink.cfg
                        clear
                        echo "${BLANCO}*********************************************************************************"
                        echo ""
                        echo "Configura el TG que utilizarás para transmitir ej: 437X "
						read tgid                        
                        echo "Configura el TG por el que quieres que salga tu transmisión ej: DMR+ = 9 Brandmeister = 214"
						read tgidsalir
                        echo "${BLANCO}Configura el número que utilizarás para conectarte a esta Regla ej: 437X "
						read tgc
                        echo "Configura el número que utilizarás para desconectarte de esta Regla ej: 8437X"
                        read tgd
                        echo "${VERDE}Configura Conexión: a demanda 10 minutos o Permanente"
                        echo "${CIAN}Introduce la letra ${AMARILLO}D${CIAN} para Demanda 10 minutos y ${AMARILLO}P${CIAN} para Permanente"
                        read conexion
                        conexion=`echo "$conexion" | tr [:lower:] [:upper:]`                        
if [ $conexion = D ]
then
sudo sed -i "72c {'SYSTEM': '$master', 'TS': 2, 'TGID': $tgid, 'ACTIVE': False, 'TIMEOUT': 10, 'TO_TYPE': 'ON',  'ON': [$tgc], 'OFF': [$tgd], 'RESET': []}," /opt/HBlink3/rules.py # a demanda
else
sudo sed -i "72c {'SYSTEM': '$master', 'TS': 2, 'TGID': $tgid, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE', 'ON': [$tgc], 'OFF': [$tgd],'RESET': []}," /opt/HBlink3/rules.py # permanente                        
fi                                                                                             
                        clear
                        echo "${BLANCO}*********************************************************************************"
                        echo ""                     
sudo sed -i "70c ]," /opt/HBlink3/rules.py
sudo sed -i "71c '$ref': [ " /opt/HBlink3/rules.py 
sudo sed -i "73c {'SYSTEM': '$ref', 'TS': 2, 'TGID': $tgidsalir, 'ACTIVE': True, 'TIMEOUT': 2, 'TO_TYPE': 'NONE',  'ON': [], 'OFF': [], 'RESET': []}," /opt/HBlink3/rules.py
                        sudo sed -i "521c MODE: PEER" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "522c ENABLED: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "523c LOOSE: True" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "524c EXPORT_AMBE: False" /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "525c IP: " /opt/HBlink3/hblink.cfg # no tocar
                        sudo sed -i "526c PORT: 54005" /opt/HBlink3/hblink.cfg # #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO DIGITOS 54005
                        sudo sed -i "529c PASSPHRASE: $password" /opt/HBlink3/hblink.cfg
                        sudo sed -i "530c CALLSIGN: $ind" /opt/HBlink3/hblink.cfg #no tocar
						echo "${MARRON}Configura la frecuencia de Recepción  ej: 9 dígitos sin punto "
						read rxf
                        sudo sed -i "532c RX_FREQ: $rxf" /opt/HBlink3/hblink.cfg
						echo "${VERDE}Configura la Frecuencia  Emisión  ej: 9 dígitos sin punto "
						read txf
                        sudo sed -i "533c TX_FREQ: $txf" /opt/HBlink3/hblink.cfg
                        sudo sed -i "534c TX_POWER: 25" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "535c COLORCODE: 1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "536c SLOTS: 2" /opt/HBlink3/hblink.cfg #no tocar
						echo "${AMARILLO}Configura tu Latitud ej: 4x.xxxxxx"
						read lat
                        sudo sed -i "537c LATITUDE: $lat" /opt/HBlink3/hblink.cfg
						echo "${BLANCO}Configura tu Longitud  ej: 2.xxxxxx"
						read lon
                        sudo sed -i "538c LONGITUDE: $lon" /opt/HBlink3/hblink.cfg
                        sudo sed -i "539c HEIGHT: 209" /opt/HBlink3/hblink.cfg #no tocar						
                        echo "${CIAN}Configura tu Ciudad ej: Barcelona"
						read ciudad
                        sudo sed -i "540c LOCATION: $ciudad" /opt/HBlink3/hblink.cfg
                        sudo sed -i "541c DESCRIPTION: This is a cool Hotspot" /opt/HBlink3/hblink.cfg #no tocar
						echo "${MARRON}Configura tu URL preferida ej: www.associacioader.com"
						read url
                        sudo sed -i "542c URL: $url" /opt/HBlink3/hblink.cfg
                        sudo sed -i "543c SOFTWARE_ID: 20191001" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "544c PACKAGE_ID: HBLINK_V106" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "545c GROUP_HANGTIME: 5" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "547c USE_ACL: True" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "548c REG_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "549c SUB_ACL: DENY:1" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "550c TGID_TS1_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "551c TGID_TS2_ACL: PERMIT:ALL" /opt/HBlink3/hblink.cfg #no tocar
                        sudo sed -i "25c 2" /home/pi/info.ini # #OJO!! CAMBIAR AL QUE CORRESPONDA EN ESTE CASO 25
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