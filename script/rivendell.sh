echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p

apt-get update
apt-get install isc-dhcp-relay -y

echo 'SERVERS="192.234.2.2"
INTERFACES="eth0 eth1"
OPTIONS=""' > /etc/default/isc-dhcp-relay

service isc-dhcp-relay restart