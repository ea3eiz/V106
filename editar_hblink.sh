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
                        # Comprueba si HBlink está instalado
                        estado_anydesk=$(awk "NR==15" /home/pi/info.ini)
                        if [ "$estado_anydesk" = 'HBLINK_EDITADO=ON' ];then
                        echo "\v\v\v\v\v\v"
                        echo "${ROJO}"
                        echo "********************************************************************************"
                        echo "********************************************************************************"
                        echo "                             HBLINK YA ESTÁ EDITADO                             "
                        echo "                         NO PUEDES VOLVER A EDITALARLO                          "
                        echo "********************************************************************************"
                        echo "********************************************************************************"
                        sleep 4
                        else
                        echo "\v\v\v\v\v\v"
                        echo "${VERDE}"
                        echo "********************************************************************************"
                        echo "********************************************************************************"
                        echo "                                EDITANDO HBLINK                                 "
                        echo "********************************************************************************"
                        echo "********************************************************************************"

                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""
						#echo "Introduce indicativo que hay ahora (EAXXXX)"
						indicativo=EAXXXX
						echo "Introduce indicativo"
						read indicativo_nuevo
						cd /opt/HBlink3
                        sudo sed "s/$indicativo/$indicativo_nuevo/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

                        sudo sed "s/$indicativo/$indicativo_nuevo/g" rules.py > temp.py
                        mv temp.py rules.py
                        
                        #echo "Password que hay ahora (PASSWORD)"
						password=PASSMASTER
						echo "Introduce Password"
						read password_nuevo
						sudo sed "s/$password/$password_nuevo/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

						#echo "Latitud que hay ahora"
						Latitud=latitude
						echo "Introduce Latitud"
						read Latitud_nueva
						sudo sed "s/$Latitud/$Latitud_nueva/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

						#echo "Longitud que hay ahora"
						Longitud=longitude
						echo "Introduce Longitud"
						read Longitud_nueva
						sudo sed "s/$Longitud/$Longitud_nueva/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

                        #echo "Id de 7 cifras que hay ahora"
						Id=1234567
						echo "Introduce Id de 7 cifras"
						read Id_nueva
						sudo sed "s/$Id/$Id_nueva/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

						#echo "Dashboard of local DMR network"
						echo "Introduce el titulo del dashboard ej: Dashboard EA3EIZ 2143175 "
						read dashboard
						sudo sed -i "1c REPORT_NAME     = '$dashboard'" /opt/HBmonitor/config.py

                        #echo "puerto del Dashboard"
						echo "Introduce puerto del dashboard ej: 8080 u otro"
						read puerto
						sudo sed -i "9c WEB_SERVER_PORT =  $puerto" /opt/HBmonitor/config.py

						sudo systemctl restart hblink & sudo systemctl restart hbmon &

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
esac
sed -i "15c HBLINK_EDITADO=ON" /home/pi/info.ini 
fi