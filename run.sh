clear

hostname="casa-resgatados.dynip.sapo.pt"

ipv4=$(dig +short $hostname | grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$' | head -n 1)

echo The public IP of the VPN is $ipv4
echo Starting the VPN bridge... The wall is going down!
echo "If there is a problem, restart the Userland application (or press Ctrl + C) and type ./run.sh again."

echo Your IPs are listed here:
echo
ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*'

# wg-tcp-tunnel --src-udp=0.0.0.0:51869 --dst-tcp=$ipv4:443

python run_python.py
