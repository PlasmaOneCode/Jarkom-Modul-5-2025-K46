echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p

apt-get update
apt-get install isc-dhcp-relay -y

echo 'SERVERS="192.234.2.2"
INTERFACES="eth0 eth1 eth2"
OPTIONS=""' > /etc/default/isc-dhcp-relay

route add -net 192.234.1.0 netmask 255.255.255.128 gw 192.234.2.30
route add -net 192.234.2.32 netmask 255.255.255.252 gw 192.234.2.30
route add -net 192.234.2.36 netmask 255.255.255.252 gw 192.234.2.30

service isc-dhcp-relay restart