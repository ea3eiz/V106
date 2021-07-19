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


                        # Actualiza V106
                        
                        #cd /home/pi/V106/Desktop
                        #cp * /home/pi/Desktop



                        cd /home/pi/.local
                        git clone http://github.com/ea3eiz/V106 
                        sleep 2
                        if [ -d /home/pi/.local/V106 ]
                        then
                        sudo rm -R /home/pi/V106
                        cp -R /home/pi/.local/V106 /home/pi                        
                        cd /home/pi
                        sudo chmod 777 -R V106
                        cd /home/pi/.local
                        sudo rm -R V106
                        else
                        clear
                        echo "${VERDE}"
                        echo "***********************************"
                        echo -n "${ROJO}"
                        echo "           ERROR DE RED            "
                        echo -n "${VERDE}"
                        echo "***********************************"
                        
                        echo "${GRIS}"
                        sleep 5
                        exit
                        fi

                        # Actualiza AUTORRANQUEV106
                        cd /home/pi/.local
                        git clone http://github.com/ea3eiz/AUTOARRANQUEV106 
                        sleep 2                      
                        if [ -d /home/pi/.local/AUTOARRANQUEV106 ]
                        then
                        sudo rm -R /home/pi/AUTOARRANQUEV106
                        cp -R /home/pi/.local/AUTOARRANQUEV106 /home/pi   
                        cd /home/pi                    
                        sudo chmod 777 -R AUTOARRANQUEV106
                        cd /home/pi/.local
                        sudo rm -R AUTOARRANQUEV106
                        else
                        echo "Error de red"
                        exit
                        fi
                        
                        if [ -f /home/pi/.local/regla2 ]
                        then
                        echo ""
                        else
                        cp /home/pi/V106/regla2 /home/pi/.local
                        fi
                        
                        if [ -f /home/pi/.local/regla3 ]
                        then
                        echo ""
                        else
                        cp /home/pi/V106/regla3 /home/pi/.local
                        fi
                        
                        if [ -f /home/pi/.local/regla4 ]
                        then
                        echo ""
                        else
                        cp /home/pi/V106/regla4 /home/pi/.local
                        fi
                        
                        if [ -f /home/pi/.local/regla5 ]
                        then
                        echo ""
                        else
                        cp /home/pi/V106/regla5 /home/pi/.local
                        fi
                        
                        if [ -f /home/pi/.local/regla6 ]
                        then
                        echo ""
                        else
                        cp /home/pi/V106/regla6 /home/pi/.local
                        fi
                        
                        if [ -f /home/pi/.local/regla7 ]
                        then
                        echo ""
                        else
                        cp /home/pi/V106/regla7 /home/pi/.local
                        fi
                        
                        if [ -f /home/pi/.local/regla8 ]
                        then
                        echo ""
                        else
                        cp /home/pi/V106/regla8 /home/pi/.local
                        fi
                        
                        if [ -f /home/pi/.local/regla9 ]
                        then
                        echo ""
                        else
                        cp /home/pi/V106/regla9 /home/pi/.local
                        fi

                        if [ -f /home/pi/.local/reglaxlx ]
                        then
                        echo ""
                        else
                        cp /home/pi/V106/reglaxlx /home/pi/.local
                        fi

                        
                        
                        # modificacion 26-04-2021
                        cp /home/pi/V106/pararservicios_hblink.sh /home/pi
                        cp /home/pi/V106/pararservicios_hblink.desktop /home/pi/.config/autostart
                        sudo chmod 777 /home/pi/pararservicios_hblink.sh
                        sudo chmod 777 /home/pi/.config/autostart/pararservicios_hblink.desktop 
                        
                        # 14-08-2020 cambio actualizar para que salgan los indicativos en DVSWITCH:
                        cd /var/lib/mmdvm
                        sudo curl --fail -o DMRIds.dat -s http://www.pistar.uk/downloads/DMRIds.dat
                        sudo chmod 777 -R /var/lib/mmdvm

                        cd $usuario/YSFClients/YSFGateway

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
                        #sudo cp $usuario/$SCRIPTS_version/ab-restart.sh /usr/local/sbin/
                        #sudo cp $usuario/$SCRIPTS_version/call_id.sh /usr/local/sbin/
                        #sudo cp $usuario/$SCRIPTS_version/ssz.sh /usr/local/sbin/
                        #sudo cp $usuario/$SCRIPTS_version/test.sh /usr/local/sbin/
#
                        #sudo chmod +x /usr/local/sbin/ab-restart.sh
                        #sudo chmod +x /usr/local/sbin/call_id.sh
                        #sudo chmod +x /usr/local/sbin/ssz.sh
                        #sudo chmod +x /usr/local/sbin/test.sh
                        #sudo chmod +x /usr/local/sbin/tune.sh

#Cambios 01-11-2020

#if [ -f /home/pi/.local/memoria_bm ]
#then
#echo ""
#else
#cp /home/pi/V106/memoria_bm /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/memoria_dmrplus ]
#then
#echo ""
#else
#cp /home/pi/V106/memoria_dmrplus /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/memoria_radio ]
#then
#echo ""
#else
#cp /home/pi/V106/memoria_radio /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/memoria_especial ]
#then
#echo ""
#else
#cp /home/pi/V106/memoria_especial /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/memoria_solofusion ]
#then
#echo ""
#else
#cp /home/pi/V106/memoria_solofusion /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/memoria_solo_dstar ]
#then
#echo ""
#else
#cp /home/pi/V106/memoria_solo_dstar /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/memoria_ysf2dmr ]
#then
#echo ""
#else
#cp /home/pi/V106/memoria_ysf2dmr /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/memoria_dmr2ysf ]
#then
#echo ""
#else
#cp /home/pi/V106/memoria_dmr2ysf /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/memoria_dmr2nxdn ]
#then
#echo ""
#else
#cp /home/pi/V106/memoria_dmr2nxdn /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/memoria_nxdn ]
#then
#echo ""
#else
#cp /home/pi/V106/memoria_nxdn /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/memorias ] 
#then
#echo ""
#else
#cp /home/pi/V106/memorias /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/nextion_bm ]
#then
#echo ""
#else
#cp /home/pi/V106/nextion_bm /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/oled_bm ]
#then
#echo ""
#else
#cp /home/pi/V106/oled_bm /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/nextion_plus ]
#then
#echo ""
#else
#cp /home/pi/V106/nextion_plus /home/pi/.local/
#fi
#
#if [ -f /home/pi/.local/oled_plus ]
#then
#echo ""
#else
#cp /home/pi/V106/oled_plus /home/pi/.local/
#fi

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
/home/pi/V106/./qt_imagen_actualizada
