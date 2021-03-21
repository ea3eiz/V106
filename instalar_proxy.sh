#!/bin/bash
cd /home/pi/
wget http://www.echolink.org/downloads/EchoLinkProxy_1_2_3.zip
unzip EchoLinkProxy_1_2_3.zip
sudo sed -i "23c cd /home/pi/" /etc/rc.local
sudo sed -i "24c java -jar EchoLinkProxy.jar ELProxy.conf &" /etc/rc.local

sudo rm EchoLinkProxy_1_2_3.zip
