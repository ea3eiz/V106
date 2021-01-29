#!/bin/bash

# path usuario
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)

SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)                                               
actualizar=S 
case $actualizar in
[sS]* ) echo ""                        
cd $usuario/NXDNClients/NXDNGateway/
rm -R private
mkdir private
cd $usuario/$SCRIPTS_version
cp NXDNHosts.txt $usuario/NXDNClients/NXDNGateway/private
cp NXDNHosts.txt $usuario/NXDNClients/NXDNGateway                            
exit	

