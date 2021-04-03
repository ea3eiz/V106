#!/bin/bash


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
                        mv temp.py hb_confbridge_rules.py
                        
                        #echo "Password que hay ahora (PASSWORD)"
						password=PASSMASTER
						echo "Introduce Password"
						read password_nuevo
						sed "s/$password/$password_nuevo/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

						#echo "Longitud que hay ahora"
						Longitud=0.0
						echo "Introduce Longitud"
						read Longitud_nueva
						sed "s/$Longitud/$Longitud_nueva/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

						#echo "Latitud que hay ahora"
						Latitud=0.0
						echo "Introduce Latitud"
						read Latitud_nueva
						sed "s/$Latitud/$Latitud_nueva/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

                        #echo "Id de 7 cifras que hay ahora"
						Id=1234567
						echo "Introduce Id de 7 cifras"
						read Id_nueva
						sed "s/$Id/$Id_nueva/g" hblink.cfg > temp.cfg
                        mv temp.cfg hblink.cfg

                        cd /opt/HBmonitor
                        sed "s/$indicativo/$indicativo_nuevo/g" index_template.html > temp.html
                        mv temp.html index_template.html

						sudo systemctl restart hblink & sudo systemctl restart hbmon &

                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
esac