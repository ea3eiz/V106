#!/bin/bash
clear

                        echo "${VERDE}"
                        echo "*******************************************"
                        echo "*           INSTALANDO ANYDESK            *"
                        echo "*******************************************"
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
                        echo "${VERDE}"
                        echo "*******************************************"
                        echo "*        SE HA INSTALADO ANYDESK          *"
                        echo "*******************************************"
                        sleep 3
                        sudo reboot