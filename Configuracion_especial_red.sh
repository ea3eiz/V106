#!/bin/bash
clear
usuario="/home/pi"
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
AUTOARRANQUE="AUTOARRANQUE"
AUTOARRANQUE=$AUTOARRANQUE$SCRIPTS_version
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"
                        echo "${VERDE}"
                        echo "   ************************************************************************" 
                        echo "                   SCRIPT PARA ESTABLECER IP FIJA POR CABLE               "
                        echo "   ************************************************************************"
                        
                        echo "${CIAN}"
                        echo "   Introduce la ip que quires fijar: ${AMARILLO}Ej.192.168.1.15 ${BLANCO}"
                        echo -n "   "
                        read ip

                        echo "${CIAN}"
                        echo "   Introduce la ip del router: ${AMARILLO}Ej.192.168.1.1 ${BLANCO}"
                        echo -n "   "
                        read gateway
                        
                        echo "${BLANCO}"
                        echo "   REVISA SI SON CORRECTOS LOS DATOS INTRODUCIDOS"
                        echo "   =============================================="

                        echo "${ROJO}"
                        echo "   *********************************************************************"
                        echo "   *                                                                   *"
                        echo "   *         OJO!!   Una vez grabado se reiniciará la Raspberry        *"
                        echo "   *                                                                   *"
                        echo "   *********************************************************************"
                        echo "${CIAN}"
                        read -p '   Quieres grabar los datos? S/N ' seguir   
                        if [ "$seguir" = 'S' -o "$seguir" = 's' ];then 
                        sudo sed -i "9c allow-hotplug eth0" /etc/network/interfaces
                        sudo sed -i "10c iface eth0 inet static" /etc/network/interfaces
                        sudo sed -i "11c address $ip" /etc/network/interfaces
                        sudo sed -i "12c netmask 255.255.255.0" /etc/network/interfaces
                        sudo sed -i "13c gateway $gateway" /etc/network/interfaces
                        sudo sed -i "14c #" /etc/network/interfaces
                        sudo sed -i "15c #" /etc/network/interfaces

                        clear
                        echo "\v\v\v\v\v\v\v\v\v\v\v"
                        echo "${VERDE}"
                        echo "   ************************************************************************"
                        echo "   *********************                              *********************" 
                        echo "   *********************       GRABANDO IP FIJA       *********************"
                        echo "   *********************                              *********************"
                        echo "   ************************************************************************"
                        sleep 5
                        clear
                        echo "\v\v\v\v\v\v\v\v\v\v\v"
                        echo "${ROJO}"
                        echo "   ************************************************************************"
                        echo "   *********************                              *********************" 
                        echo "   *********************         REINICIANDO          *********************"
                        echo "   *********************                              *********************"
                        echo "   ************************************************************************"
                        sleep 5
                        sudo reboot
                        else
                        clear
                        echo "\v\v\v\v\v\v\v\v\v\v\v"
                        echo "${ROJO}"
                        echo "   ************************************************************************"
                        echo "   *********************                              *********************" 
                        echo "   *********************   NO SE GRABARON LOS DATOS   *********************"
                        echo "   *********************                              *********************"
                        echo "   ************************************************************************"
                        sleep 5
                        fi
                    