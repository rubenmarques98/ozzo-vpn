hostname="casa-resgatados.dynip.sapo.pt"

ipv4=$(dig +short $hostname | grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$' | head -n 1)

wg-tcp-tunnel --src-udp=0.0.0.0:51869 --dst-tcp=$ipv4:$1