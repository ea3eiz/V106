#!/bin/bash
		                clear
						echo "\33[1;32m<<<< ESCANEANDO DISPOSITIVOS BLUETOOTH >>>>"
						echo ""
						echo "\33[1;36m" # color Cian
						sudo hcitool scan
						echo "\33[1;32m" #color verde
						echo "Copia la mac del modulo Bluetooth HC-05 para pegarla en el siguiente paso"
						echo ""
						echo "\33[1;33m" #amarillo
			            echo "PEGA LA MAC DE TU BLUETOOTH aquí y pulsa Enter"	          		            
			            read mac
					    #sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh actualizar_02_07_06.sh;sudo rfcomm bind /dev/rfcomm1 $mac'" /home/pi/.config/autostart/actualizar.desktop
                        sudo sed -i "3c sudo rfcomm bind /dev/rfcomm1 $mac" /home/pi/.local/bluetooth.sh
                        clear
						echo ""
						echo ""
						echo ""
						echo "\33[1;31m" #color rojo
						echo "********************************************************************"
						echo "*    SE VA A REINICIAR EL SISTEMA PARA ANCLAR EL PUERTO rfcomm1    *"
						echo "********************************************************************"
						echo "\33[1;37m" #color
						echo "Pulsa Enter para seguir"
			            sleep 3
						sudo reboot

