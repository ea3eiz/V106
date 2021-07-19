#!/bin/bash

#*********************************************************************************************
# **************** esto está en el fichero /var/www/html/cambia_configuracion_port.php *******
#*********************************************************************************************

# guardamos el valor para luego recuperarlo llamando al script cambia_puerto_usrp.sh
# exec("sudo sed -i '40c $port' /home/pi/.local/datos_dvswitch");
# exec("cd /home/pi/V106; sudo sh cambia_puerto_usrp.sh");

# Recuperamos el número de puerto guardado en la linea 40 de /home/pi/.local/datos_dvswitch y adjudicamos a la variable "valor"
valor=$(awk "NR==40" /home/pi/.local/datos_dvswitch) 

# Escribe el puerto en la linea 21 del fichero /opt/Analog_Bridge/analog_bridge.sh
sed -i "34c mode=\`cat \/tmp\/ABInfo_$valor.json \| python -c \'import json,sys;obj=json.load(sys.stdin); print obj\[\"tlv\"\]\[\"ambe_mode\"\];\'\`" /opt/Analog_Bridge/analog_bridge.sh
