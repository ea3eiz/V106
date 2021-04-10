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
                        echo "                           ACTIVANDO REGLA Y PEER 2                            "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        sleep 5

# 0 = La Regla NO está creada
# 1 = La Regla SI está creada
# 2 = La Regla está ACTIVADA
# 3 = La Regla está DESACTIVADO

estado=$(awk "NR==22" /home/pi/info.ini)

if [ $estado = 3 ]
then

sudo sed -i "222c ENABLED: True" /opt/HBlink3/hblink.cfg

line40=$(awk "NR==40" /opt/HBlink3/rules.py)
line40=${line40#"#"} #borra la primera letra de la variable
sudo sed -i "40c $line40" /opt/HBlink3/rules.py

line41=$(awk "NR==41" /opt/HBlink3/rules.py)
line41=${line41#"#"} #borra la primera letra de la variable
sudo sed -i "41c $line41" /opt/HBlink3/rules.py

line42=$(awk "NR==42" /opt/HBlink3/rules.py)
line42=${line42#"#"} #borra la primera letra de la variable
sudo sed -i "42c $line42" /opt/HBlink3/rules.py

line43=$(awk "NR==43" /opt/HBlink3/rules.py)
line43=${line43#"#"} #borra la primera letra de la variable
sudo sed -i "43c $line43" /opt/HBlink3/rules.py

sudo systemctl restart hbmon
sudo systemctl restart hblink

sudo sed -i "22c 2" /home/pi/info.ini


                        clear
                        echo "\v\v\v"
                        echo "${AMARILLO}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                      SE HA ACTIVADO LA REGLA y PEER 2                       "
                        echo "*****************************************************************************"
                        echo "${CIAN}"
                        echo "Pulsa Enter para salir "
                        read a
elif [ $estado = 22 ]
then

                        clear
                        echo "\v\v\v"
                        echo "${ROJO}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                       LA REGLA y PEER 2  NO ESTÁ CREADA                      "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "${CIAN}"
                        echo "Pulsa Enter para salir "
                        read a
                        exit
else

                        clear
                        echo "\v\v\v"
                        echo "${ROJO}"
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "                       LA REGLA y PEER 2  YA ESTABA ACTIVADA                     "
                        echo "*****************************************************************************"
                        echo "*****************************************************************************"
                        echo "${CIAN}"
                        echo "Pulsa Enter para salir "
                        read a
                        exit


fi

