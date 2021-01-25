#!/bin/bash
clear
echo "   ************************************************************************"
echo "   *                                                                      *"
echo "                Restaurando MMDVMHost del dia 24-01-2021                   "
echo "   *                                                                      *"
echo "   ************************************************************************"
                                sudo rm -R /home/pi/MMDVMHost
                                cp -r -a /home/pi/.local/MMDVMHost_24-01-2021 /home/pi/
                                cd /home/pi/
                                mv MMDVMHost_24-01-2021 MMDVMHost
                                sudo chmod 777 -R MMDVMHost
                                sleep 3
                                exit;
