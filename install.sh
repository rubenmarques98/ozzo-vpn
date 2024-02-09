set -e -x

clear

sudo rm -rf ~/*

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git -y
sudo apt-get install dnsutils -y

sudo git clone https://github.com/rubenmarques98/ozzo-vpn.git ~

sudo chmod 777 -R ~/

sudo sh ~/configure.sh

sudo cp -r /root/* /home/userland/

sudo chmod 777 -R /root/

sudo chmod 777 -R /home/userland