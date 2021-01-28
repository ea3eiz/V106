#!/bin/bash
clear
						echo "\v\v\v\v\v"
						echo "${VERDE}"
						echo "   **************************************************************************"
						echo "   **************************************************************************"
						echo "${VERDE}"
						echo "                   ACTUALIZANDO LISTADO DE SALAS YSF y FCS       "
						echo "                                                                             "
						echo -n "${VERDE}"
						echo "   **************************************************************************"
						echo "   **************************************************************************"
						echo "*******************************************"
						echo "* ACTUALIZANDO LISTADO DE SALAS YSF y FCS *"
						echo "* *****************************************"
						sleep 3
			            echo "${VERDE}"						
						cd $usuario/YSFClients/YSFGateway
						sudo chmod 777 -R $usuario/YSFClients/YSFGateway
						sudo wget -O YSFHosts.txt http://register.ysfreflector.de/export_csv.php					
						wget -O FCSRooms.txt https://raw.githubusercontent.com/g4klx/YSFClients/master/YSFGateway/FCSRooms.txt 
						sleep 3
						clear
						echo "\v\v\v\v\v"
						echo "${BLANCO}"
						echo "   **************************************************************************"
						echo "   **************************************************************************"
						echo "${VERDE}"
						echo "             Los fichero YSFHost.txt y FCSRooms.txt se han actualizado       "
						echo "                                                                             "
						echo -n "${BLANCO}"
						echo "   **************************************************************************"
						echo "   **************************************************************************"
						sleep 3
						exit;
						