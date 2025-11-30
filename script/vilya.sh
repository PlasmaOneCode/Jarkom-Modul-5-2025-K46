apt-get update
apt-get install isc-dhcp-server -y

echo '# DHCP Server Configuration
ddns-update-style none;
option domain-name "jarkom.local";
option domain-name-servers 192.234.2.3;
default-lease-time 600;
max-lease-time 7200;
authoritative;
log-facility local7;

# A2 - Server Network
subnet 192.234.2.0 netmask 255.255.255.248 {
}

# A9 - Elendil (Jane - 200) + Isildur (Policeboo - 30)
subnet 192.234.0.0 netmask 255.255.255.0 {
    range 192.234.0.2 192.234.0.254;
    option routers 192.234.0.1;
    option broadcast-address 192.234.0.255;
    option domain-name-servers 192.234.2.3;
}

# A12 - Gilgalad (Ellen - 100) + Cirdan (Lycaon - 20)
subnet 192.234.1.0 netmask 255.255.255.128 {
    range 192.234.1.2 192.234.1.126;
    option routers 192.234.1.1;
    option broadcast-address 192.234.1.127;
    option domain-name-servers 192.234.2.3;
}

# A6 - Durin (Caesar - 50)
subnet 192.234.1.128 netmask 255.255.255.192 {
    range 192.234.1.130 192.234.1.190;
    option routers 192.234.1.129;
    option broadcast-address 192.234.1.191;
    option domain-name-servers 192.234.2.3;
}

# A7 - Khamul (Burnice - 5)
subnet 192.234.1.192 netmask 255.255.255.192 {
    range 192.234.1.194 192.234.1.254;
    option routers 192.234.1.193;
    option broadcast-address 192.234.1.255;
    option domain-name-servers 192.234.2.3;
}' > /etc/dhcp/dhcpd.conf

echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server

service isc-dhcp-server restart
service isc-dhcp-server status