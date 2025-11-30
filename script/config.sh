# Osgilliath (Central Router)
# eth0 - ke NAT/Internet
auto eth0
iface eth0 inet dhcp

# eth1 - A1: ke Rivendell
auto eth1
iface eth1 inet static
	address 192.234.2.9
	netmask 255.255.255.252

# eth2 - A3: ke Moria
auto eth2
iface eth2 inet static
	address 192.234.2.13
	netmask 255.255.255.252

# eth3 - A8: ke Minastir
auto eth3
iface eth3 inet static
	address 192.234.2.25
	netmask 255.255.255.252

# Rivendell (DHCP Relay)
# eth0 - A1: ke Osgilliath
auto eth0
iface eth0 inet static
	address 192.234.2.10
	netmask 255.255.255.252
	gateway 192.234.2.9

# eth1 - A2: ke Switch1 (Vilya, Narya)
auto eth1
iface eth1 inet static
	address 192.234.2.1
	netmask 255.255.255.248

# Moria
# eth0 - A3: ke Osgilliath
auto eth0
iface eth0 inet static
	address 192.234.2.14
	netmask 255.255.255.252
	gateway 192.234.2.13

# eth1 - A4: ke Switch2 (IronHills)
auto eth1
iface eth1 inet static
	address 192.234.2.17
	netmask 255.255.255.252

# eth2 - A5: ke Wilderland
auto eth2
iface eth2 inet static
	address 192.234.2.21
	netmask 255.255.255.252

# eth0 - A5: ke Moria
auto eth0
iface eth0 inet static
	address 192.234.2.22
	netmask 255.255.255.252
	gateway 192.234.2.21

# eth1 - A6: ke Switch3 (Durin)
auto eth1
iface eth1 inet static
	address 192.234.1.129
	netmask 255.255.255.192

# eth2 - A7: ke Khamul
auto eth2
iface eth2 inet static
	address 192.234.1.193
	netmask 255.255.255.192

# Minastir (DHCP Relay)
# eth0 - A8: ke Osgilliath
auto eth0
iface eth0 inet static
	address 192.234.2.26
	netmask 255.255.255.252
	gateway 192.234.2.25

# eth1 - A9: ke Switch4 (Elendil, Isildur)
auto eth1
iface eth1 inet static
	address 192.234.0.1
	netmask 255.255.255.0

# eth2 - A10: ke Pelargir
auto eth2
iface eth2 inet static
	address 192.234.2.29
	netmask 255.255.255.252

# Pelargir
# eth0 - A10: ke Minastir
auto eth0
iface eth0 inet static
	address 192.234.2.30
	netmask 255.255.255.252
	gateway 192.234.2.29

# eth1 - A11: ke AnduinBanks
auto eth1
iface eth1 inet static
	address 192.234.2.33
	netmask 255.255.255.252

# eth2 - A13: ke Palantir
auto eth2
iface eth2 inet static
	address 192.234.2.37
	netmask 255.255.255.252

# eth3 - A12: ke Switch5 (Gilgalad, Cirdan)
auto eth3
iface eth3 inet static
	address 192.234.1.1
	netmask 255.255.255.128

# AnduinBanks (DHCP Relay)
# eth0 - A11: ke Pelargir
auto eth0
iface eth0 inet static
	address 192.234.2.34
	netmask 255.255.255.252
	gateway 192.234.2.33

# Vilya (DHCP Server)
# eth0 - A2: ke Switch1
auto eth0
iface eth0 inet static
	address 192.234.2.2
	netmask 255.255.255.248
	gateway 192.234.2.1

# Narya (DNS Server)
# eth0 - A2: ke Switch1
auto eth0
iface eth0 inet static
	address 192.234.2.3
	netmask 255.255.255.248
	gateway 192.234.2.1

# Ironhills (Web Server 1)
# eth0 - A4: ke Switch2
auto eth0
iface eth0 inet static
	address 192.234.2.18
	netmask 255.255.255.252
	gateway 192.234.2.17

up echo nameserver 192.234.2.3 > /etc/resolv.conf

# Palantir (Web Server 2)
# eth0 - A13: ke Pelargir
auto eth0
iface eth0 inet static
	address 192.234.2.38
	netmask 255.255.255.252
	gateway 192.234.2.37

up echo nameserver 192.234.2.3 > /etc/resolv.conf

# Elendil (Client)
# A9 - DHCP Client
auto eth0
iface eth0 inet dhcp

up echo nameserver 192.234.2.3 > /etc/resolv.conf

# Isildur (Client)
# A9 - DHCP Client
auto eth0
iface eth0 inet dhcp

up echo nameserver 192.234.2.3 > /etc/resolv.conf

# Gilgalad (Client)
# A12 - DHCP Client
auto eth0
iface eth0 inet dhcp

up echo nameserver 192.234.2.3 > /etc/resolv.conf

# Cirdan (Client)
# A12 - DHCP Client
auto eth0
iface eth0 inet dhcp

up echo nameserver 192.234.2.3 > /etc/resolv.conf

# Durin (Client)
# A6 - DHCP Client
auto eth0
iface eth0 inet dhcp

up echo nameserver 192.234.2.3 > /etc/resolv.conf

# Khamul (Client)
# A7 - DHCP Client
auto eth0
iface eth0 inet dhcp

up echo nameserver 192.234.2.3 > /etc/resolv.conf