#!/bin/bash

                    # Antes de actualizar, hace una copia de seguridad para que cuando acabe la restaure
                    cd /home/pi/V106
                    sudo sh copiar_restaurar_copiar.sh
                    
                    # Guarda el fichero TODOS_LOS_INIS.ini para recuperarlo después de la actualización
                    cp /home/pi/MMDVMHost/TODOS_LOS_INIS.ini /home/pi

                    cd /home/pi
                    sudo rm -r /home/pi/MMDVMHost
                    sudo apt-get install build-essential git-core libi2c-dev i2c-tools lm-sensors
                    git clone https://github.com/g4klx/MMDVMHost
                    cd MMDVMHost
                    git clone https://github.com/hallard/ArduiPi_OLED
                    cd ArduiPi_OLED
                    sudo make clean
                    sudo make
                                        
                    #git clone https://github.com/ea3eiz/MMDVMHost
                    cd /home/pi/MMDVMHost

                    HOY=$(date +%Y%m%d)
                    FIJA="const char* VERSION = "\"
                    PI="ADER106"\"
                    HOY1=$HOY$PI
                    PUNTO=";"   
                    
                    sed -i "22c $FIJA$HOY1$PUNTO" /home/pi/MMDVMHost/Version.h

                    make clean
                    make -f Makefile.Pi.OLED

                    #Instala la secion [NextionDriver] en todos los .ini y todas sus memorias
                    cd /home/pi/NextionDriverInstaller
                    sudo ./NextionDriver_ConvertConfig /home/pi/MMDVMHost/MMDVM.ini
                    sleep 2                  
                    
                    sed -i "5c Duplex=0" /home/pi/MMDVMHost/MMDVM.ini
                    sed -i "193c Type=Direct" /home/pi/MMDVMHost/MMDVM.ini
                    sed -i "196c #Local=62032" /home/pi/MMDVMHost/MMDVM.ini
                    sed -i "197c Password=PASSWORD" /home/pi/MMDVMHost/MMDVM.ini

                    # Crea los ejecutables para estas aplicaciones 
                    cd /home/pi/MMDVMHost
                    cp MMDVMHost MMDVMBM
                    cp MMDVMHost MMDVMPLUS
                    cp MMDVMHost MMDVMDSTAR
                    cp MMDVMHost MMDVMFUSION
                    cp MMDVMHost DMR2NXDN
                    cp MMDVMHost DMR2YSF
                    cp MMDVMHost MMDVMDMR2M17
                    cp MMDVMHost MMDVMNXDN
                    cp MMDVMHost MMDVMESPECIAL
                    cp MMDVMHost MMDVMDMRGATEWAY                 
                    
                    # Crea el fichero para que arranque NextionDriver ==================
                    cp MMDVM.ini MMDVM.ini_NextionDriver

                    # Crea los ficheros .ini y Memorias ==================
                    cp MMDVM.ini MMDVM.ini_original
                    cp MMDVM.ini MMDVM.ini_copia
                    cp MMDVM.ini MMDVM.ini_copia2
                    cp MMDVM.ini MMDVM.ini_copia3

                    cp MMDVM.ini MMDVMBM.ini
                    cp MMDVM.ini MMDVMBM.ini_copia
                    cp MMDVM.ini MMDVMBM.ini_copia2
                    cp MMDVM.ini MMDVMBM.ini_copia3

                    cp MMDVM.ini MMDVMPLUS.ini
                    cp MMDVM.ini MMDVMPLUS.ini_copia
                    cp MMDVM.ini MMDVMPLUS.ini_copia2
                    cp MMDVM.ini MMDVMPLUS.ini_copia3

                    cp MMDVM.ini MMDVMDSTAR.ini
                    cp MMDVM.ini MMDVMDSTAR.ini_copia
                    cp MMDVM.ini MMDVMDSTAR.ini_copia2
                    cp MMDVM.ini MMDVMDSTAR.ini_copia3

                    cp MMDVM.ini MMDVMFUSION.ini
                    cp MMDVM.ini MMDVMFUSION.ini_copia
                    cp MMDVM.ini MMDVMFUSION.ini_copia2
                    cp MMDVM.ini MMDVMFUSION.ini_copia3  

                    cp MMDVM.ini MMDVMESPECIAL.ini
                    cp MMDVM.ini MMDVMESPECIAL.ini_copia
                    cp MMDVM.ini MMDVMESPECIAL.ini_copia2
                    cp MMDVM.ini MMDVMESPECIAL.ini_copia3                

                    cp MMDVM.ini MMDVMNXDN.ini
                    
                    cp MMDVM.ini TODOS_LOS_INIS.ini

                    cp MMDVM.ini MMDVMDMR2YSF.ini
                    
                    cp MMDVM.ini MMDVMDMR2NXDN.ini

                    cp MMDVM.ini MMDVMDMR2M17.ini
                  
                    cp MMDVM.ini MMDVMDMRGateway.ini 
                    
                    sed -i "193c Type=Gateway" /home/pi/MMDVMHost/MMDVMDMRGateway.ini
                    sed -i "196c Local=62032" /home/pi/MMDVMHost/MMDVMDMRGateway.ini
                    
                    sed -i "196c Local=62032" /home/pi/MMDVMHost/MMDVMDMR2YSF.ini
                    sed -i "196c Local=62032" /home/pi/MMDVMHost/MMDVMDMR2NXDN.ini
                    sed -i "196c Local=62037" /home/pi/MMDVMHost/MMDVMDMR2M17.ini

                    # recoge el fichero MMDVMDMRGateway.ini para ponerlo en el MMDVMHost
                    # cp /home/pi/MMDVMDMRGateway.ini /home/pi/MMDVMHost

                    # recoge el fichero DMRGateway.ini para ponerlo en el DMRGateway
                    # cp /home/pi/DMRGateway.ini /home/pi/DMRGateway
                    
                    # Recoge el fichero TODOS_LOS_INIS.ini para ponerlo en el MMDVMHost
                    cp /home/pi/TODOS_LOS_INIS.ini /home/pi/MMDVMHost
                

                    #=================================================

                    # Despues de actualizar, restaura la copia de seguridad
                    cd /home/pi/V106
                    sudo sh copiar_restaurar_restaurar.sh

                    sudo chmod 777 -R /home/pi/MMDVMHost
                    exit;
