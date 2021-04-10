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

                        echo "\v\v\v"
                        echo "${VERDE}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                           DESACTIVANDO REGLA Y PEER 2                       "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5
                        actualizar=S
                        case $actualizar in
                        [sSyY]* ) echo ""

# 0 = La Regla NO está creada
# 1 = La Regla SI está creada
# 2 = La Regla está ACTIVADA
# 3 = La Regla está DESACTIVADA

estado=$(awk "NR==22" /home/pi/info.ini)
if [ $estado = 0 ];then 

echo "La Regla NO está creada"
sleep 5
exit
elif [ $estado = 2 ];then
echo "LaRegla está activada y la desactivamos"
sleep 5

else
sudo sed -i "222c ENABLED: False" /opt/HBlink3/hblink.cfg

line40=$(awk "NR==40" /opt/HBlink3/rules.py)
sudo sed -i "40c #$line40" /opt/HBlink3/rules.py

line41=$(awk "NR==41" /opt/HBlink3/rules.py)
sudo sed -i "41c #$line41" /opt/HBlink3/rules.py

line42=$(awk "NR==42" /opt/HBlink3/rules.py)
sudo sed -i "42c #$line42" /opt/HBlink3/rules.py

line43=$(awk "NR==43" /opt/HBlink3/rules.py)
sudo sed -i "43c #$line43" /opt/HBlink3/rules.py

sudo systemctl restart hbmon
sudo systemctl restart hblink

fi
                        break;;
                        [Nn]* ) echo ""
                        clear
                        break;;
                        esac
