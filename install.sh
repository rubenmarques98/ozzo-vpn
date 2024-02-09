set -e -x

clear

sudo rm -rf ~/ozzo-vpn

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git -y

git clone https://github.com/rubenmarques98/ozzo-vpn.git .

sudo chmod 777 -R .

sh ./configure.sh