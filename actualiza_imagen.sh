#!/bin/bash
# path usuario

usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)
version=`expr substr $SCRIPTS_version 2 2`
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
echo "   *************************************************************************"
echo "   *                     ACTUALIZANDO POSIBLES CAMBIOS                     *"
echo "   *                         EN LA IMAGEN ADER ${AMARILLO}$SCRIPTS_version${VERDE}                        *"
echo "   *************************************************************************"
echo "${CIAN}"
sleep 2
                        # Actualiza IMAGEN 
                        cd $usuario/$SCRIPTS_version
                        git pull
                        sleep 1

                        # Actualiza AUTORRANQUEV105
                        cd $usuario/AUTOARRANQUEV105
                        git pull
                        sleep 1
                        sudo chmod 777 -R /home/pi/AUTOARRANQUEV105
                        
                        # 31-10-2020 poner version V-25-10-20 en Web DVSWITCH
			            sed -i "11c 25-10-20" $usuario/info.ini

                        # 14-08-2020 cambio actualizar para que salgan los indicativos en DVSWITCH:
                        cd /var/lib/mmdvm
                        sudo curl --fail -o DMRIds.dat -s http://www.pistar.uk/downloads/DMRIds.dat
                        sudo chmod 777 -R /var/lib/mmdvm

                        cd $usuario/YSFClients/YSFGateway

                        # 02-08-2020 cambio quitar sistema actual:
                        cd /home/pi/V105
                        sudo rm /var/www/html/panel_configuracion.php
                        cp panel_configuracion.php /var/www/html

                        # 14-07-2020 agrega esta linea a TGIF
                        tgif_on_off=$(awk "NR==21" /home/pi/status.ini)
                        if [ $tgif_on_off = "MARCA_TGIF=OFF" ]
                        then
			            sed -i "107c TGRewrite0=2,10,2,9,1" $usuario/DMRGateway/DMRGateway.ini
                        sed -i "21c MARCA_TGIF=ON" /home/pi/status.ini
                        else
                        echo ""
                        fi

                        # 26-08-2020 actualizar salas DSTAR
                        cd /usr/share/opendv/
                        sudo curl --fail -o DExtra_Hosts.txt -s http://www.pistar.uk/downloads/DExtra_Hosts.txt
                        sleep 1
                        sudo curl --fail -o DCS_Hosts.txt -s http://www.pistar.uk/downloads/DCS_Hosts.txt
                        sleep 1
                        sudo curl --fail -o DPlus_Hosts.txt -s http://www.pistar.uk/downloads/DPlus_Hosts.txt

                        # 26-08-2020 actualizar salas DSTAR
                        cd /usr/local/share/opendv/
                        sudo curl --fail -o DExtra_Hosts.txt -s http://www.pistar.uk/downloads/DExtra_Hosts.txt
                        sleep 1
                        sudo curl --fail -o DCS_Hosts.txt -s http://www.pistar.uk/downloads/DCS_Hosts.txt
                        sleep 1
                        sudo curl --fail -o DPlus_Hosts.txt -s http://www.pistar.uk/downloads/DPlus_Hosts.txt
                        
                        # 26-08-2020 actualizar salas dv4mini
                        sudo cp DExtra_Hosts.txt $usuario/dv4mini/xref.ip

                        # Cambio 04-10-2020 para que funcione el cambiar de sistemas desde la app dvswitch
                        sudo cp $usuario/$SCRIPTS_version/ab-restart.sh /usr/local/sbin/
                        sudo cp $usuario/$SCRIPTS_version/call_id.sh /usr/local/sbin/
                        sudo cp $usuario/$SCRIPTS_version/ssz.sh /usr/local/sbin/
                        sudo cp $usuario/$SCRIPTS_version/test.sh /usr/local/sbin/

                        sudo chmod +x /usr/local/sbin/ab-restart.sh
                        sudo chmod +x /usr/local/sbin/call_id.sh
                        sudo chmod +x /usr/local/sbin/ssz.sh
                        sudo chmod +x /usr/local/sbin/test.sh
                        #sudo chmod +x /usr/local/sbin/tune.sh

#Cambios 01-11-2020

if [ -f /home/pi/.local/memoria_bm ]
then
echo ""
else
cp /home/pi/V105/memoria_bm /home/pi/.local/
fi

if [ -f /home/pi/.local/memoria_dmrplus ]
then
echo ""
else
cp /home/pi/V105/memoria_dmrplus /home/pi/.local/
fi

if [ -f /home/pi/.local/memoria_radio ]
then
echo ""
else
cp /home/pi/V105/memoria_radio /home/pi/.local/
fi

if [ -f /home/pi/.local/memoria_especial ]
then
echo ""
else
cp /home/pi/V105/memoria_especial /home/pi/.local/
fi

if [ -f /home/pi/.local/memoria_solofusion ]
then
echo ""
else
cp /home/pi/V105/memoria_solofusion /home/pi/.local/
fi

if [ -f /home/pi/.local/memoria_solo_dstar ]
then
echo ""
else
cp /home/pi/V105/memoria_solo_dstar /home/pi/.local/
fi

if [ -f /home/pi/.local/memoria_ysf2dmr ]
then
echo ""
else
cp /home/pi/V105/memoria_ysf2dmr /home/pi/.local/
fi

if [ -f /home/pi/.local/memoria_dmr2ysf ]
then
echo ""
else
cp /home/pi/V105/memoria_dmr2ysf /home/pi/.local/
fi

if [ -f /home/pi/.local/memoria_dmr2nxdn ]
then
echo ""
else
cp /home/pi/V105/memoria_dmr2nxdn /home/pi/.local/
fi

if [ -f /home/pi/.local/memoria_nxdn ]
then
echo ""
else
cp /home/pi/V105/memoria_nxdn /home/pi/.local/
fi

if [ -f /home/pi/.local/memorias ] 
then
echo ""
else
cp /home/pi/V105/memorias /home/pi/.local/
fi

if [ -f /home/pi/.local/nextion_bm ]
then
echo ""
else
cp /home/pi/V105/nextion_bm /home/pi/.local/
fi

if [ -f /home/pi/.local/oled_bm ]
then
echo ""
else
cp /home/pi/V105/oled_bm /home/pi/.local/
fi

if [ -f /home/pi/.local/nextion_plus ]
then
echo ""
else
cp /home/pi/V105/nextion_plus /home/pi/.local/
fi

if [ -f /home/pi/.local/oled_plus ]
then
echo ""
else
cp /home/pi/V105/oled_plus /home/pi/.local/
fi

                        #Lee el fichero INFO_RXF para poner los datos en los iconos INFO TXF 
                        frecuencia=$(awk "NR==1" $usuario/INFO_RXF)
                        cd $usuario/Desktop/
                        sudo cp RXF_BM.desktop $usuario/
                        sed -i "11c Name=$frecuencia" $usuario/RXF_BM.desktop
                        cd $usuario
                        sudo cp RXF_BM.desktop $usuario/Desktop
                        sudo rm $usuario/RXF_BM.desktop

                        frecuencia=$(awk "NR==2" $usuario/INFO_RXF)
                        cd $usuario/Desktop/
                        sudo cp RXF_DMRPLUS.desktop $usuario/
                        sed -i "11c Name=$frecuencia" $usuario/RXF_DMRPLUS.desktop
                        cd $usuario
                        sudo cp RXF_DMRPLUS.desktop $usuario/Desktop
                        sudo rm $usuario/RXF_DMRPLUS.desktop

                        frecuencia=$(awk "NR==14" $usuario/INFO_RXF)
                        cd $usuario/Desktop/
                        sudo cp RXF_DMR2YSF.desktop $usuario/
                        sed -i "11c Name=$frecuencia" $usuario/RXF_DMR2YSF.desktop
                        cd $usuario
                        sudo cp RXF_DMR2YSF.desktop $usuario/Desktop
                        sudo rm $usuario/RXF_DMR2YSF.desktop

                        frecuencia=$(awk "NR==17" $usuario/INFO_RXF)
                        cd $usuario/Desktop/
                        sudo cp RXF_NXDN.desktop $usuario/
                        sed -i "11c Name=$frecuencia" $usuario/RXF_NXDN.desktop
                        cd $usuario
                        sudo cp RXF_NXDN.desktop $usuario/Desktop
                        sudo rm $usuario/RXF_NXDN.desktop

clear
/home/pi/V105/./imagen_actualizada
# echo "${VERDE}"
# echo "\v\v\v\v\v"
# echo "   *************************************************************************"
# echo "   *************************************************************************"
# echo "   **************************  ${BLANCO}IMAGEN ACTUALIZADA ${VERDE}**************************"
# echo "   *************************************************************************"
# echo "   *************************************************************************"
# sleep 1
# clear
#echo "${BLANCO}"
#echo "\v\v\v\v\v"
#echo "   *************************************************************************"
#echo "   *************************************************************************"
#echo "   **************************  ${VERDE}IMAGEN ACTUALIZADA ${BLANCO}**************************"
#echo "   *************************************************************************"
#echo "   *************************************************************************"
#sleep 1
# clear
# echo "${VERDE}"
# echo "\v\v\v\v\v"
# echo "   *************************************************************************"
# echo "   *************************************************************************"
# echo "   **************************  ${BLANCO}IMAGEN ACTUALIZADA ${VERDE}**************************"
# echo "   *************************************************************************"
# echo "   *************************************************************************"
# sleep 3
