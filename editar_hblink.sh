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
                        echo "***********************************************************************"
                        echo "***********************************************************************"
                        echo "                         HBLINK YA ESTÁ EDITADO                        "
                        echo "                      NO PUEDES VOLVER A EDITALARLO                    "
                        echo "***********************************************************************"
                        echo "***********************************************************************"
                        sleep 4
                        else
                        echo "\v\v\v\v\v\v"
                        echo "${VERDE}"
                        echo "***********************************************************************"
                        echo "***********************************************************************"
                        echo "                         EDITANDO HBLINK                               "
                        echo "***********************************************************************"
                        echo "***********************************************************************"

                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""
						#echo "Introduce indicativo que hay ahora (EAXXXX)"
						indicativo=EAXXXX
						echo "Introduce indicativo"
						read indicativo_nuevo
						cd /opt/HBlink3
                        sed "s/$indicativo/$indicativo_nuevo/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

                        sed "s/$indicativo/$indicativo_nuevo/g" rules.py > temp.py
                        mv temp.py rules.py
                        
                        #echo "Password que hay ahora (PASSWORD)"
						password=PASSMASTER
						echo "Introduce Password"
						read password_nuevo
						sed "s/$password/$password_nuevo/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

						#echo "Latitud que hay ahora"
						Latitud=latitude
						echo "Introduce Latitud"
						read Latitud_nueva
						sed "s/$Latitud/$Latitud_nueva/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

						#echo "Longitud que hay ahora"
						Longitud=longitude
						echo "Introduce Longitud"
						read Longitud_nueva
						sed "s/$Longitud/$Longitud_nueva/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

                        #echo "Id de 7 cifras que hay ahora"
						Id=1234567
						echo "Introduce Id de 7 cifras"
						read Id_nueva
						sed "s/$Id/$Id_nueva/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

						#echo "Dashboard of local DMR network"
						cd /opt/HBmonitor
						dsahboard=of local DMR network
						sed "s/$dsahboard/$indicativo_nuevo/g" config.py > temp.cfg
                        mv temp.cfg config.py

						sudo systemctl restart hblink & sudo systemctl restart hbmon &

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
esac
fi