# Enable IP Forwarding
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p

# Routing
route add -net 192.234.2.0 netmask 255.255.255.248 gw 192.234.2.10
route add -net 192.234.2.16 netmask 255.255.255.252 gw 192.234.2.14
route add -net 192.234.2.20 netmask 255.255.255.252 gw 192.234.2.14
route add -net 192.234.1.128 netmask 255.255.255.192 gw 192.234.2.14
route add -net 192.234.1.192 netmask 255.255.255.192 gw 192.234.2.14
route add -net 192.234.0.0 netmask 255.255.255.0 gw 192.234.2.26
route add -net 192.234.2.28 netmask 255.255.255.252 gw 192.234.2.26
route add -net 192.234.2.32 netmask 255.255.255.252 gw 192.234.2.26
route add -net 192.234.1.0 netmask 255.255.255.128 gw 192.234.2.26
route add -net 192.234.2.36 netmask 255.255.255.252 gw 192.234.2.26

# NAT Configuration
apt-get update
apt-get install iptables-persistent -y
ETH0_IP=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
iptables -t nat -A POSTROUTING -s 192.234.0.0/16 -o eth0 -j SNAT --to-source $ETH0_IP
iptables -P FORWARD ACCEPT
iptables-save > /etc/iptables/rules.v4