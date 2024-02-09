set -e -x

clear

sudo rm -rf /root/*
sudo rm -rf /home/userland/*

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git -y
sudo apt-get install dnsutils -y

sudo git clone https://github.com/rubenmarques98/ozzo-vpn.git /root

sudo chmod 777 -R /root

sudo sh /root/configure.sh

sudo cp -r /root/* /home/userland/

sudo chmod 777 -R /root/

sudo chmod 777 -R /home/userland