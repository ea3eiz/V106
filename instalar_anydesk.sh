#!/bin/bash
clear

                        # Comprueba si Anydesk está instalado
                        estado_anydesk=$(awk "NR==12" /home/pi/info.ini)
                        if [ "$estado_anydesk" = 'ANYDESK=ON' ];then
                        echo "no hace nada"
                        else
                        echo "${VERDE}"
                        echo "***********************************************************************"
                        echo "                         INSTALANDO ANYDESK                            "
                        echo "***********************************************************************"
                        sleep 2  
                        sudo rm -R /home/pi/.anydesk
                        mkdir /home/pi/.temp
                        cd /home/pi/.temp
                        wget http://download.anydesk.com/rpi/anydesk_2.9.4-1_armhf.deb
                        sudo apt update
                        sudo dpkg -i anydesk_2.9.4-1_armhf.deb
                        sudo apt-get install -f
                        sudo rm /home/pi/.local/RESTAURAR/Downloads/anydesk_2.9.4-1_armhf.deb
                        clear
                        echo "${AMARILLO}"
                        echo "***********************************************************************"
                        echo "                  SE HA INSTALADO ANYDESK CON EXITO                    "
                        echo "***********************************************************************"                       
                        sed -i "12c ANYDESK=ON" /home/pi/info.ini                        
                        sleep 3
                        sudo reboot
                        fi