#!/bin/bash
clear
while true
do
clear
# path usuario
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)

DIRECTORIO="YSF2DMR.ini"
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)

                    # Datos para el panel de control 
                    frec=$(awk "NR==2" $usuario/YSF2DMR/YSF2DMR.ini)
                    sed -i "24c $frec" $usuario/info_panel_control.ini
                    tg=$(awk "NR==43" $usuario/YSF2DMR/YSF2DMR.ini)
                    sed -i "26c $tg" $usuario/info_panel_control.ini
                    master=$(awk "NR==46" $usuario/YSF2DMR/YSF2DMR.ini)
                    sed -i "25c $master" $usuario/info_panel_control.ini

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

linea_info_memoria="55c" #Linea del MMDVM donde guardamos el nombre de la memoria

echo "${VERDE}"
echo "   **************************************************************************"
echo -n "${CIAN}"
echo "                       Script para Modificar $DIRECTORIO       "
echo -n "${ROJO}"
echo "                               $SCRIPTS_version by EA3EIZ"
echo -n "${VERDE}"
echo "   **************************************************************************"

echo -n "\33[1;36m   1)\33[0m Modificar RXFrequency - \33[1;33m"
var1= sed -n 2p  $usuario/YSF2DMR/YSF2DMR.ini;

echo -n "\33[1;36m   2)\33[0m Modificar TXFrequency - \33[1;33m"
var2= sed -n 3p  $usuario/YSF2DMR/YSF2DMR.ini;

echo -n "\33[1;36m   3)\33[0m Latitud               - \33[1;33m"
var3= sed -n 5p  $usuario/YSF2DMR/YSF2DMR.ini;

echo -n "\33[1;36m   4)\33[0m Longitud              - \33[1;33m"
var4= sed -n 6p  $usuario/YSF2DMR/YSF2DMR.ini;

echo -n "\33[1;36m   5)\33[0m Modificar Location    - \33[1;33m"
var5= sed -n 8p  $usuario/YSF2DMR/YSF2DMR.ini;

echo -n "\33[1;36m   6)\33[0m Modificar URL         - \33[1;33m"
var6= sed -n 10p  $usuario/YSF2DMR/YSF2DMR.ini;

echo -n "\33[1;36m   7)\33[0m Modificar indicativo  - \33[1;33m"
var7= sed -n 13p  $usuario/YSF2DMR/YSF2DMR.ini;

echo -n "\33[1;36m   8)\33[0m DstPort               - \33[1;33m"
var2=`grep -n -m 1 "DstPort" $usuario/YSF2DMR/YSF2DMR.ini`
buscar=":"
largo_linea=`expr index $var2 $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var2 1 $largo_linea`
DstPort=$(awk "NR==$numero_linea" $usuario/YSF2DMR/YSF2DMR.ini)
letra=c
linea_sed_8=$numero_linea$letra
echo "$DstPort"

echo -n "\33[1;36m   9)\33[0m LocalPort             - \33[1;33m"
var2=`grep -n -m 1 "LocalPort" $usuario/YSF2DMR/YSF2DMR.ini`
buscar=":"
largo_linea=`expr index $var2 $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var2 1 $largo_linea`
LocalPort=$(awk "NR==$numero_linea" $usuario/YSF2DMR/YSF2DMR.ini)
letra=c
linea_sed_9=$numero_linea$letra
echo "$LocalPort"

echo -n "${CIAN}  10)${GRIS} Modificar ID          - ${AMARILLO}"
idd=`grep -n "^Id=" $usuario/YSF2DMR/YSF2DMR.ini`
buscar=":"
largo_linea=`expr index $idd $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $idd 1 $largo_linea`
Idds=$(awk "NR==$numero_linea" $usuario/YSF2DMR/YSF2DMR.ini)
letra=c
linea_sed_10=$numero_linea$letra
echo "$Idds"

echo -n "\33[1;36m  11)\33[0m Talkgroup             - \33[1;33m"
var2=`grep -n -m 1 "StartupDstId" $usuario/YSF2DMR/YSF2DMR.ini`
buscar=":"
largo_linea=`expr index $var2 $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var2 1 $largo_linea`
Talkgroup=$(awk "NR==$numero_linea" $usuario/YSF2DMR/YSF2DMR.ini)
letra=c
linea_sed_11=$numero_linea$letra
echo "$Talkgroup"

echo -n "\33[1;36m  12)\33[0m StartupPC             - \33[1;33m"
var2=`grep -n -m 1 '\<Address\>' $usuario/YSF2DMR/YSF2DMR.ini`
buscar=":"
largo_linea=`expr index $var2 $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var2 1 $largo_linea`
numero_linea=`expr $numero_linea - 1`
StartupPC=$(awk "NR==$numero_linea" $usuario/YSF2DMR/YSF2DMR.ini)
letra=c
linea_sed_12=$numero_linea$letra
echo "$StartupPC"

echo -n "\33[1;36m  13)\33[0m Address               - \33[1;33m"
var2=`grep -n -m 1 '\<Address\>' $usuario/YSF2DMR/YSF2DMR.ini`
buscar=":"
largo_linea=`expr index $var2 $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var2 1 $largo_linea`
Addre=$(awk "NR==$numero_linea" $usuario/YSF2DMR/YSF2DMR.ini)
letra=c
linea_sed_13=$numero_linea$letra
echo "$Addre"

echo -n "\33[1;36m  14)\33[0m Port                  - \33[1;33m"
var2=`grep -n -m 1 '\<Address\>' $usuario/YSF2DMR/YSF2DMR.ini`
buscar=":"
largo_linea=`expr index $var2 $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var2 1 $largo_linea`
numero_linea=`expr $numero_linea + 1`
Port=$(awk "NR==$numero_linea" $usuario/YSF2DMR/YSF2DMR.ini)
letra=c
linea_sed_14=$numero_linea$letra
echo "$Port"

echo -n "\33[1;36m  15)\33[0m Password              - \33[1;33m"
var2=`grep -n -m 1 '\<Address\>' $usuario/YSF2DMR/YSF2DMR.ini`
buscar=":"
largo_linea=`expr index $var2 $buscar`
largo_linea=`expr $largo_linea - 1`
numero_linea=`expr substr $var2 1 $largo_linea`
numero_linea_pass=`expr $numero_linea + 7`
pass=$(awk "NR==$numero_linea_pass" $usuario/YSF2DMR/YSF2DMR.ini)
letra=c
linea_sed_15=$numero_linea_pass$letra
echo "$pass"

echo -n "${CIAN}  27)${GRIS} Entra reflector DMR+  - ${AMARILLO}"
OPCION=`expr $numero_linea_pass + 1`
OPCION1=$(awk "NR==$OPCION" $usuario/YSF2DMR/YSF2DMR.ini)
linea33port=$OPCION
echo "$OPCION1"

echo ""
echo "\33[1;36m  16)\33[1;37m Guardar  fichero de Configuración en M1 \33[1;36m"
echo -n "\33[1;36m  17)\33[1;32m Utilizar fichero de Configuración de M1: \33[1;36m"
reflector=`grep -n -m 1 '\<Address\>' $usuario/YSF2DMR/YSF2DMR.ini_copia_01`
buscar=":"
largo=`expr index $reflector $buscar`
largo=`expr $largo + 9`
copia1=`expr substr $reflector $largo 40`
echo -n "$copia1"
memoria1=$(awk "NR==26" $usuario/.local/memorias)
echo " - $memoria1"

echo ""
echo "\33[1;36m  18)\33[1;37m Guardar  fichero de Configuración en M2 \33[1;36m"
echo -n "\33[1;36m  19)\33[1;32m Utilizar fichero de Configuración de M2: \33[1;36m"
reflector=`grep -n -m 1 '\<Address\>' $usuario/YSF2DMR/YSF2DMR.ini_copia_02`
buscar=":"
largo=`expr index $reflector $buscar`
largo=`expr $largo + 9`
copia2=`expr substr $reflector $largo 40`
echo -n "$copia2"
memoria2=$(awk "NR==27" $usuario/.local/memorias)
echo " - $memoria2"

echo ""
echo "\33[1;36m  20)\33[1;37m Guardar  fichero de Configuración en M3 \33[1;36m"
echo -n "\33[1;36m  21)\33[1;32m Utilizar fichero de Configuración de M3: \33[1;36m"
reflector=`grep -n -m 1 '\<Address\>' $usuario/YSF2DMR/YSF2DMR.ini_copia_03`
buscar=":"
largo=`expr index $reflector $buscar`
largo=`expr $largo + 9`
copia3=`expr substr $reflector $largo 40`
echo -n "$copia3"
memoria3=$(awk "NR==28" $usuario/.local/memorias)
echo " - $memoria3"

echo ""
echo "\33[1;36m  22)\33[1;37m Guardar  fichero de Configuración en M4 \33[1;36m"
echo -n "\33[1;36m  23)\33[1;32m Utilizar fichero de Configuración de M4: \33[1;36m"
reflector=`grep -n -m 1 '\<Address\>' $usuario/YSF2DMR/YSF2DMR.ini_copia_04`
buscar=":"
largo=`expr index $reflector $buscar`
largo=`expr $largo + 9`
copia4=`expr substr $reflector $largo 40`
echo -n "$copia4"
memoria4=$(awk "NR==29" $usuario/.local/memorias)
echo " - $memoria4"

echo ""
echo "\33[1;36m  28)\33[1;33m Abrir fichero YSF2DMR.ini para hacer cualquier cambio\33[1;33m"

echo ""
echo "   ${ROJO}0) Salir"
echo ""
echo -n "\33[1;36m   Elige una opción: " 
read escoger_menu

case $escoger_menu in
011) echo ""
while true
do
buscar=":"
largo=`expr index $ind $buscar`
echo "Valor actual Indicativo: \33[1;33m${ind#*=}\33[1;37m"
           	          read -p 'Introduce tu indicativo: ' indicativo
                          letra=c
                          if [ $largo = 3 ]
                          then
                          linea=`expr substr $ind 1 1`
                          else
                          linea=`expr substr $ind 1 1`
                          fi
                          linea=$linea$letra
                          actualizar=S 
                          case $actualizar in
			              [sS]* ) echo ""
			              indicativo=`echo "$indicativo" | tr -d '[[:space:]]'`
                          sed -i "$linea Callsign=$indicativo" $usuario/YSF2DMR/YSF2DMR.ini
			  break;;
			  [nN]* ) echo ""
			  break;;
esac
done;;
1) echo ""
while true
do
                          rxf=`grep -n "RXFrequency" $usuario/YSF2DMR/YSF2DMR.ini`
                          rxf1=`expr substr $rxf 15 9`
                          echo "   Valor de  RXFrequency =\33[1;33m $rxf1"
                          echo -n "\33[1;37m"
                          read -p '   Introduce RXFrequency = ' rx
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "2c RXFrequency=$rx" $usuario/YSF2DMR/YSF2DMR.ini

frec=$(awk "NR==2" $usuario/YSF2DMR/YSF2DMR.ini)
sed -i "24c $frec" $usuario/info_panel_control.ini


                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
2) echo ""
while true
do
                          

                          txf=`grep -n "TXFrequency" $usuario/YSF2DMR/YSF2DMR.ini`
                          txf1=`expr substr $txf 15 9`
                          echo "   Valor de  TXFrequency =\33[1;33m $rxf1"
                          echo -n "\33[1;37m"
                          read -p '   Introduce TXFrequency = ' tx
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "3c TXFrequency=$tx" $usuario/YSF2DMR/YSF2DMR.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
3) echo ""
while true
do
                          

                          lat=`grep -n "Latitude" $usuario/YSF2DMR/YSF2DMR.ini`
                          lat1=`expr substr $lat 12 12`
                          echo "   Valor de  Latitud =\33[1;33m $lat1"
                          echo -n "\33[1;37m"
                          read -p '   Introduce Latitud = ' lat
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "5c Latitude=$lat" $usuario/YSF2DMR/YSF2DMR.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
4) echo ""
while true
do
                          

                          lonng=`grep -n "Longitude" $usuario/YSF2DMR/YSF2DMR.ini`
                          lonng1=`expr substr $lonng 13 12`
                          echo "   Valor de  Longitud =\33[1;33m $lonng1"
                          echo -n "\33[1;37m"
                          read -p '   Introduce Longitud = ' lon
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "6c Longitude=$lon" $usuario/YSF2DMR/YSF2DMR.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
5) echo ""
while true
do
                          

                          lat=`grep -n "Location" $usuario/YSF2DMR/YSF2DMR.ini`
                          lat1=`expr substr $lat 12 30`
                          echo "   Valor de  Ciudad =\33[1;33m $lat1"
                          echo -n "\33[1;37m"
                          read -p '   Introduce Ciudad = ' loc1
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""

                          #quita los espacios que se entren en el imput
                          loc1=`echo "$loc1" | tr -d '[[:space:]]'`
                          sed -i "8c Location=$loc1" $usuario/YSF2DMR/YSF2DMR.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
6) echo ""
while true
do
                          

                          lonng=`grep -n "URL" $usuario/YSF2DMR/YSF2DMR.ini`
                          lonng1=`expr substr $lonng 8 30`
                          echo "   Valor de  URL =\33[1;33m $lonng1"
                          echo -n "\33[1;37m"
                          read -p '   Introduce URL = ' lon
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "10c URL=$lon" $usuario/YSF2DMR/YSF2DMR.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
7) echo ""
while true
do
                          

                          lonng=`grep -n "Callsign" $usuario/YSF2DMR/YSF2DMR.ini`
                          lonng1=`expr substr $lonng 13 30`
                          echo "   Valor de  Indicativo =\33[1;33m $lonng1"
                          echo -n "\33[1;37m"
                          read -p '   Introduce Indicativo = ' lon
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""

                          #Convierte indicativo si se introduce en minúsculas a Mayúsculas
                          lonM=`echo "$lon" | tr [:lower:] [:upper:]`
                          lonM=`echo "$lonM" | tr -d '[[:space:]]'` #quita espacios
                          sed -i "13c Callsign=$lonM" $usuario/YSF2DMR/YSF2DMR.ini
                          sed -i "72c AprsCallsign=$lonM" $usuario/YSF2DMR/YSF2DMR.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
8) echo ""
while true
do
                          

                          lonng=`grep -n "DstPort" $usuario/YSF2DMR/YSF2DMR.ini`
                          lonng1=`expr substr $lonng 12 30`
                          echo "   Valor  de  DstPort  =\33[1;33m $lonng1"
                          echo -n "\33[1;32m"
                          echo "   El valor correcto es: 3200"
                          echo -n "\33[1;37m"
                          read -p '   Introduce  DstPort  = ' lon
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_8 DstPort=$lon" $usuario/YSF2DMR/YSF2DMR.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
9) echo ""
while true
do
                          

                          lonng=`grep -n "LocalPort" $usuario/YSF2DMR/YSF2DMR.ini`
                          lonng1=`expr substr $lonng 14 30`
                          echo "   Valor de LocalPort  =\33[1;33m $lonng1"
                          echo -n "\33[1;32m"
                          echo "   El valor correcto es: 4200"
                          echo -n "\33[1;37m"
                          read -p '   Introduce LocalPort = ' lon
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_9 LocalPort=$lon" $usuario/YSF2DMR/YSF2DMR.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
10) echo ""
while true
do                         
                          echo -n "\33[1;37m"
                          read -p '   Introduce Id = ' lon
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_10 Id=$lon" $usuario/YSF2DMR/YSF2DMR.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
11) echo ""
while true
do
                          

                          lonng=`grep -n "StartupDstId" $usuario/YSF2DMR/YSF2DMR.ini`
                          lonng1=`expr substr $lonng 17 30`
                          echo "   Valor de StartupDstId  =\33[1;33m $lonng1"
                          echo -n "\33[1;32m"
                          echo "   valor para DMR+=9  para Brandmeister Talkgroup Ej. (214)"
                          echo -n "\33[1;37m"
                          read -p '   Introduce StartupDstId = ' lon
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_11 StartupDstId=$lon" $usuario/YSF2DMR/YSF2DMR.ini

tg=$(awk "NR==$linea_sed_11" $usuario/YSF2DMR/YSF2DMR.ini)
sed -i "26c $tg" $usuario/info_panel_control.ini

                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
12) echo ""
while true
do
                          

                          echo "\33[1;32m   El Valor 0 para llamar a talkgroup 1 para llamada privada a una Id\33[1;37m" 
                          read -p '   Introduce StartupPC = ' lon
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_12 StartupPC=$lon" $usuario/YSF2DMR/YSF2DMR.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
13) echo ""
while true
do                      
                          echo "\33[1;32m   Brandmeister=master.spain-dmr.es  DMR+=212.237.3.141\33[1;37m" 
                          read -p '   Introduce Address = ' lon
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""

                          #Convierte Mayúsculas en minúsculas
                          lon=`echo "$lon" | tr [:upper:] [:lower:]`

master=$(awk "NR==$linea_sed_13" $usuario/YSF2DMR/YSF2DMR.ini)
sed -i "25c $master" $usuario/info_panel_control.ini


                          sed -i "$linea_sed_13 Address=$lon" $usuario/YSF2DMR/YSF2DMR.ini

                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
14) echo ""
while true
do                      
                          echo "\33[1;32m   Puerto para Brandmeister=62031 para DMR+=55555\33[1;37m" 
                          read -p '   Introduce Port = ' lon
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_14 Port=$lon" $usuario/YSF2DMR/YSF2DMR.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
15) echo ""
while true
do                      
                          read -p '   Introduce Password Personal de Brandmeister = ' lon
                          actualizar=S 
                          case $actualizar in
                          [sS]* ) echo ""
                          sed -i "$linea_sed_15 Password=$lon" $usuario/YSF2DMR/YSF2DMR.ini
                          break;;
                          [nN]* ) echo ""
                          break;;
esac
done;;
16) echo ""
while true
do
                        actualizar=S
                        case $actualizar in
			                  [sS]* ) echo ""
                        clear
                        echo "Introduce nombre memoria máximo 10 caracteres"
                        read memoria1
                        echo "<<<<<< Haciendo copia de seguridad de la M1 >>>>>"
                        sleep 3
                        echo "$linea_info_memoria $usuario $DIRECTORIO $memoria1"
                        sed -i "$primer $memoria1" $usuario/info_panel_control.ini
                        #sed -i "$linea_info_memoria $memoria1" $usuario/MMDVMHost/$DIRECTORIO 
sudo sed -i "26c $memoria1" $usuario/.local/memorias
sudo sed -i "25c $memoria1" $usuario/.local/memorias               
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO $usuario/MMDVMHost/$DIRECTORIO_copia
			                  break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
17) echo ""
while true
do
                        actualizar=S
                        case $actualizar in
                        [sS]* ) echo ""
                        clear
                        echo "<<<<<< Restaurando copia de seguridad de la M1 >>>>>"
                        sleep 3
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO_copia $usuario/MMDVMHost/$DIRECTORIO
sudo sed -i "25c $memoria1" $usuario/.local/memorias
                        break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
18) echo ""
while true
do
                        actualizar=S 
                        case $actualizar in
			                  [sS]* ) echo ""
                        clear
                        echo "Introduce nombre memoria máximo 10 caracteres"
                        read memoria2
                        echo "<<<<<< Haciendo copia de seguridad de la M2 >>>>>"
                        sleep 3
                        sed -i "$segun $memoria2" $usuario/info_panel_control.ini
                        #sed -i "$linea_info_memoria $memoria2" $usuario/MMDVMHost/$DIRECTORIO
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO $usuario/MMDVMHost/$DIRECTORIO_copia2
sudo sed -i "27c $memoria2" $usuario/.local/memorias
sudo sed -i "25c $memoria2" $usuario/.local/memorias
			                  break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
19) echo ""
while true
do
                        actualizar=S 
                        case $actualizar in
			                  [sS]* ) echo ""
                        clear
                        echo "<<<<<< Restaurando copia de seguridad  de la M2 >>>>>"
                        sleep 3
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO_copia2 $usuario/MMDVMHost/$DIRECTORIO
sudo sed -i "25c $memoria2" $usuario/.local/memorias			                  
                        break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
20) echo ""
while true
do
                        actualizar=S 
                        case $actualizar in
			                  [sS]* ) echo ""
                        clear
                        echo "Introduce nombre memoria máximo 10 caracteres"
                        read memoria3
                        echo "<<<<<< Haciendo copia de seguridad de la M3 >>>>>"
                        sleep 3
                        sed -i "$tercer $memoria3" $usuario/info_panel_control.ini
                        #sed -i "$linea_info_memoria $memoria3" $usuario/MMDVMHost/$DIRECTORIO
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO $usuario/MMDVMHost/$DIRECTORIO_copia3
sudo sed -i "28c $memoria3" $usuario/.local/memorias
sudo sed -i "25c $memoria3" $usuario/.local/memorias
			                  break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
21) echo ""
while true
do
                        actualizar=S 
                        case $actualizar in
			                  [sS]* ) echo ""
                        clear
                        echo "<<<<<< Restaurando copia de seguridad de la M3 >>>>>"
                        sleep 3
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO_copia3 $usuario/MMDVMHost/$DIRECTORIO
sudo sed -i "25c $memoria3" $usuario/.local/memorias			                  
                        break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
22) echo ""
while true
do
                        actualizar=S 
                        case $actualizar in
			                  [sS]* ) echo ""
                        clear
                        echo "Introduce nombre memoria máximo 10 caracteres"
                        read memoria3
                        echo "<<<<<< Haciendo copia de seguridad de la M3 >>>>>"
                        sleep 3
                        sed -i "$tercer $memoria3" $usuario/info_panel_control.ini
                        #sed -i "$linea_info_memoria $memoria3" $usuario/MMDVMHost/$DIRECTORIO
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO $usuario/MMDVMHost/$DIRECTORIO_copia3
sudo sed -i "29c $memoria3" $usuario/.local/memorias
sudo sed -i "25c $memoria3" $usuario/.local/memorias
			                  break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
23) echo ""
while true
do
                        actualizar=S 
                        case $actualizar in
			                  [sS]* ) echo ""
                        clear
                        echo "<<<<<< Restaurando copia de seguridad de la M3 >>>>>"
                        sleep 3
                        sudo cp -f $usuario/MMDVMHost/$DIRECTORIO_copia3 $usuario/MMDVMHost/$DIRECTORIO
sudo sed -i "25c $memoria3" $usuario/.local/memorias			                  
                        break;;
			                  [nN]* ) echo ""
			                  break;;
esac
done;;
27) echo ""
while true
do
                          read -p 'Estas en DMR+ ? S/N ' actualizar                                          
                          case $actualizar in
                          [sS]* ) echo ""
                          read -p 'Intruduce reflector DMR+ al que se conectara (ej:4370) ' opcion
                          letra1=c
                          linea4=$linea33port$letra1
                          if [ $opcion = 21465 ]
                          then
                          sed -i "$linea4 Options=StartRef=4000;RelinkTime=15;TS2_1=21465" $usuario/YSF2DMR/YSF2DMR.ini
                          else
                          sed -i "$linea4 Options=StartRef=$opcion;RelinkTime=10;" $usuario/YSF2DMR/YSF2DMR.ini
                          fi
                          break;;
                          [nN]* ) echo ""
                          letra1=c
                          linea4=$linea33port$letra1
                          sed -i "$linea4 #Options=" $usuario/YSF2DMR/YSF2DMR.ini
                          break;;
esac
done;;
28) echo ""
while true
do
                              actualizar=S 
                              case $actualizar in
			                        [sS]* ) echo ""
                              geany $usuario/YSF2DMR/YSF2DMR.ini
			                        break;;
			                        [nN]* ) echo ""
			                        break;;
esac

done;;

0) echo ""
clear
echo "\33[1;33m   **************************************************"
echo "   *                                                *"
echo "   *     CERRANDO SCRIPT                            *"
echo "   *                                                *"
echo "   **************************************************"
sleep 1
clear
exit;;	
esac
done

