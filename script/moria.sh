echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p

route add -net 192.234.1.128 netmask 255.255.255.192 gw 192.234.2.22
route add -net 192.234.1.192 netmask 255.255.255.192 gw 192.234.2.22