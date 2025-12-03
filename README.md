# Jarkom-Modul-5-2025-K46

===========[Kelompok 46]=============

| Nama | NRP |
|--------|-----------|
| Abiyyu Raihan Putra Wikanto | 5027241042 |
| Mutiara Diva Jaladitha | 5027241083 |

============[PENJELASAN SOAL]=============
Topologi Praktikum Modul 5 di gns3

<img width="1262" height="763" alt="image" src="https://github.com/user-attachments/assets/1b01eb6d-15a1-46d4-a1c8-62caaae5da62" />

## Misi 1
    Identifikasi Perangkat:
    
    Narya: Berfungsi sebagai DNS Server.
    Vilya: Berfungsi sebagai DHCP Server.
    Web Servers: Palantir  dan IronHills.
    Client (Pasukan):
    Khamul: 5 host (Target/Burnice).
    Cirdan: 20 host (Lycaon).
    Isildur: 30 host (Policeboo).
    Durin: 50 host (Caesar).
    Gilgalad: 100 host (Ellen).
    Elendil: 200 host (Jane).

Setelah membagi alamat IP menggunakan VLSM (Prefix IP sesuai kelompok), gambarkan pohon subnet yang menunjukkan hierarki pembagian IP di jaringan Aliansi. Lingkari subnet yang akan dilewati.

Buatlah konfigurasi rute untuk menghubungkan semua subnet dengan benar. Pastikan perangkat dapat saling terhubung.

    Konfigurasi Service → Dikerjakan setelah Misi 2 No. 1:
    
    Vilya sebagai DHCP Server agar perangkat dalam Khamul, Durin, Gilgalad, Elendil, Cirdan, dan Isildur menerima IP otomatis.
    AnduinBanks, Rivendell, dan Minastir berfungsi sebagai DHCP Relay.
    Narya sebagai DNS Server.
    Palantir dan IronHills sebagai Web Server (Apache/Nginx).
    Buat index.html berisikan : "Welcome to {hostname}".

## TABEL VLSM

<img width="1316" height="792" alt="TopologiModul5-vlsm" src="https://github.com/user-attachments/assets/107848d1-664f-494c-b18b-5791261a1071" />

| Subnet | Rute | Jumlah IP | Prefix | Netmask | Network ID | Broadcast | Range | Gateway |
|--------|-------|-----------|--------|-------------------|----------------|----------------|----------------------------------------|----------------|
| A9  | Osgiliath > Minastir > Elendil, Isildur | 231 | /24 | 255.255.255.0   | 192.234.0.0   | 192.234.0.255 | 192.234.0.1 – 192.234.0.254   | 192.234.0.1 |
| A12 | Osgiliath > Minastir > Pelargir > AnduinBanks > Gilgalad, Cirdan | 121 | /25 | 255.255.255.128 | 192.234.1.0   | 192.234.1.127 | 192.234.1.1 – 192.234.1.126 | 192.234.1.1 |
| A6  | Osgiliath > Moria > Wilderland > Durin | 51 | /26 | 255.255.255.192 | 192.234.1.128 | 192.234.1.191 | 192.234.1.129 – 192.234.1.190 | 192.234.1.129 |
| A7  | Osgiliath > Moria > Wilderland > Khamul | 6 | /29 | 255.255.255.248 | 192.234.1.192 | 192.234.1.199 | 192.234.1.193 – 192.234.1.198 | 192.234.1.193 |
| A2  | Osgiliath > Rivendell > Vilya, Narya | 3 | /29 | 255.255.255.248 | 192.234.1.200 | 192.234.1.207 | 192.234.1.201 – 192.234.1.206 | 192.234.1.201 |
| A1  | Osgiliath > Rivendell | 2 | /30 | 255.255.255.252 | 192.234.1.208 | 192.234.1.211 | 192.234.1.209 – 192.234.1.210 | 192.234.1.209 |
| A3  | Osgiliath > Moria | 2 | /30 | 255.255.255.252 | 192.234.1.212 | 192.234.1.215 | 192.234.1.213 – 192.234.1.214 | 192.234.1.213 |
| A4  | Osgiliath > Moria > IronHills | 2 | /30 | 255.255.255.252 | 192.234.1.216 | 192.234.1.219 | 192.234.1.217 – 192.234.1.218 | 192.234.1.217 |
| A5  | Osgiliath > Moria > Wilderland | 2 | /30 | 255.255.255.252 | 192.234.1.220 | 192.234.1.223 | 192.234.1.221 – 192.234.1.222 | 192.234.1.221 |
| A8  | Osgiliath > Minastir | 2 | /30 | 255.255.255.252 | 192.234.1.224 | 192.234.1.227 | 192.234.1.225 – 192.234.1.226 | 192.234.1.225 |
| A10 | Osgiliath > Minastir > Pelargir | 2 | /30 | 255.255.255.252 | 192.234.1.228 | 192.234.1.231 | 192.234.1.229 – 192.234.1.230 | 192.234.1.229 |
| A11 | Osgiliath > Minastir > Pelargir > AnduinBanks | 2 | /30 | 255.255.255.252 | 192.234.1.232 | 192.234.1.235 | 192.234.1.233 – 192.234.1.234 | 192.234.1.233 |
| A13 | Osgiliath > Minastir > Pelargir > Palantir | 2 | /30 | 255.255.255.252 | 192.234.1.236 | 192.234.1.239 | 192.234.1.237 – 192.234.1.238 | 192.234.1.237 |
| **Total** |  | **428** | **/23** |  |  |  |  |  |

---

## KONFIGURASI NETWORK

### OSGILLIATH (Central Router)

```bash
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
address 192.234.1.209
netmask 255.255.255.252

auto eth2
iface eth2 inet static
address 192.234.1.213
netmask 255.255.255.252

auto eth3
iface eth3 inet static
address 192.234.1.225
netmask 255.255.255.252
```

**Script**
```bash
# IP Forwarding
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p

# Routing
route add -net 192.234.1.200 netmask 255.255.255.248 gw 192.234.1.210
route add -net 192.234.1.216 netmask 255.255.255.252 gw 192.234.1.214
route add -net 192.234.1.220 netmask 255.255.255.252 gw 192.234.1.214
route add -net 192.234.1.128 netmask 255.255.255.192 gw 192.234.1.214
route add -net 192.234.1.192 netmask 255.255.255.248 gw 192.234.1.214
route add -net 192.234.0.0 netmask 255.255.255.0 gw 192.234.1.226
route add -net 192.234.1.228 netmask 255.255.255.252 gw 192.234.1.226
route add -net 192.234.1.232 netmask 255.255.255.252 gw 192.234.1.226
route add -net 192.234.1.0 netmask 255.255.255.128 gw 192.234.1.226
route add -net 192.234.1.236 netmask 255.255.255.252 gw 192.234.1.226

# NAT with SNAT (TIDAK MENGGUNAKAN MASQUERADE)
apt-get update
apt-get install iptables-persistent -y

ETH0_IP=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
iptables -t nat -A POSTROUTING -s 192.234.0.0/16 -o eth0 -j SNAT --to-source $ETH0_IP

iptables -P FORWARD ACCEPT
iptables-save > /etc/iptables/rules.v4
```
**Jalankan Script**
```
chmod +x /root/osgiliath.sh && /root/osgiliath.sh
```

---

### RIVENDELL (DHCP Relay)

```bash
auto eth0
iface eth0 inet static
address 192.234.1.210
netmask 255.255.255.252
gateway 192.234.1.209

auto eth1
iface eth1 inet static
address 192.234.1.201
netmask 255.255.255.248

up echo "nameserver 8.8.8.8" > /etc/resolv.conf
up echo "nameserver 1.1.1.1" >> /etc/resolv.conf
```

**Script**
```bash
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p

apt-get update
apt-get install isc-dhcp-relay -y

echo 'SERVERS="192.234.1.202"
INTERFACES="eth0 eth1"
OPTIONS=""' > /etc/default/isc-dhcp-relay

service isc-dhcp-relay restart
```
**Jalankan Script**
```
chmod +x /root/rivendell.sh && /root/rivendell.sh
```

---

### MORIA

```bash
auto eth0
iface eth0 inet static
address 192.234.1.214
netmask 255.255.255.252
gateway 192.234.1.213

auto eth1
iface eth1 inet static
address 192.234.1.217
netmask 255.255.255.252

auto eth2
iface eth2 inet static
address 192.234.1.221
netmask 255.255.255.252

up echo "nameserver 8.8.8.8" > /etc/resolv.conf
up echo "nameserver 1.1.1.1" >> /etc/resolv.conf
```

**Script**
```bash
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p

route add -net 192.234.1.128 netmask 255.255.255.192 gw 192.234.1.222
route add -net 192.234.1.192 netmask 255.255.255.248 gw 192.234.1.222
```
**Jalankan Script**
```
chmod +x /root/moria.sh && /root/moria.sh
```

---

### WILDERLAND (DHCP Relay)

```bash
auto eth0
iface eth0 inet static
address 192.234.1.222
netmask 255.255.255.252
gateway 192.234.1.221

auto eth1
iface eth1 inet static
address 192.234.1.129
netmask 255.255.255.192

auto eth2
iface eth2 inet static
address 192.234.1.193
netmask 255.255.255.248

up echo "nameserver 8.8.8.8" > /etc/resolv.conf
up echo "nameserver 1.1.1.1" >> /etc/resolv.conf
```

**Script**
```bash
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p

apt-get update
apt-get install isc-dhcp-relay -y

echo 'SERVERS="192.234.1.202"
INTERFACES="eth0 eth1 eth2"
OPTIONS=""' > /etc/default/isc-dhcp-relay

service isc-dhcp-relay restart
```
**Jalankan Script**
```
chmod +x /root/wilderland.sh && /root/wilderland.sh
```

---

### MINASTIR (DHCP Relay)

```bash
auto eth0
iface eth0 inet static
address 192.234.1.226
netmask 255.255.255.252
gateway 192.234.1.225

auto eth1
iface eth1 inet static
address 192.234.0.1
netmask 255.255.255.0

auto eth2
iface eth2 inet static
address 192.234.1.229
netmask 255.255.255.252

up echo "nameserver 8.8.8.8" > /etc/resolv.conf
up echo "nameserver 1.1.1.1" >> /etc/resolv.conf
```

**Script**
```bash
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p

apt-get update
apt-get install isc-dhcp-relay -y

echo 'SERVERS="192.234.1.202"
INTERFACES="eth0 eth1 eth2"
OPTIONS=""' > /etc/default/isc-dhcp-relay

route add -net 192.234.1.0 netmask 255.255.255.128 gw 192.234.1.230
route add -net 192.234.1.232 netmask 255.255.255.252 gw 192.234.1.230
route add -net 192.234.1.236 netmask 255.255.255.252 gw 192.234.1.230

service isc-dhcp-relay restart
```
**Jalankan Script**
```
chmod +x /root/minastir.sh && /root/minastir.sh
```

---

### PELARGIR

```bash
auto eth0
iface eth0 inet static
address 192.234.1.230
netmask 255.255.255.252
gateway 192.234.1.229

auto eth1
iface eth1 inet static
address 192.234.1.233
netmask 255.255.255.252

auto eth2
iface eth2 inet static
address 192.234.1.237
netmask 255.255.255.252

auto eth3
iface eth3 inet static
address 192.234.1.1
netmask 255.255.255.128

up echo "nameserver 8.8.8.8" > /etc/resolv.conf
up echo "nameserver 1.1.1.1" >> /etc/resolv.conf
```

**Script**
```bash
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p
```
**Jalankan Script**
```
chmod +x /root/pelargir.sh && /root/pelargir.sh
```

---

### ANDUINBANKS (DHCP Relay)

```bash
auto eth0
iface eth0 inet static
address 192.234.1.234
netmask 255.255.255.252
gateway 192.234.1.233

up echo "nameserver 8.8.8.8" > /etc/resolv.conf
up echo "nameserver 1.1.1.1" >> /etc/resolv.conf
```

**Script**
```bash
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p

apt-get update
apt-get install isc-dhcp-relay -y

echo 'SERVERS="192.234.1.202"
INTERFACES="eth0"
OPTIONS=""' > /etc/default/isc-dhcp-relay

route add -net 192.234.1.0 netmask 255.255.255.128 gw 192.234.1.233

service isc-dhcp-relay restart
```
**Jalankan Script**
```
chmod +x /root/anduinbanks.sh && /root/anduinbanks.sh
```

---

## KONFIGURASI SERVICE

### VILYA (DHCP Server)

```bash
auto eth0
iface eth0 inet static
address 192.234.1.202
netmask 255.255.255.248
gateway 192.234.1.201

up echo "nameserver 8.8.8.8" > /etc/resolv.conf
up echo "nameserver 1.1.1.1" >> /etc/resolv.conf
```

**Script**
```bash
apt-get update
apt-get install isc-dhcp-server -y

cat > /etc/dhcp/dhcpd.conf << 'EOF'
ddns-update-style none;
option domain-name "jarkom.local";
option domain-name-servers 192.234.1.203;
default-lease-time 600;
max-lease-time 7200;
authoritative;

subnet 192.234.1.200 netmask 255.255.255.248 {}

subnet 192.234.0.0 netmask 255.255.255.0 {
    range 192.234.0.2 192.234.0.254;
    option routers 192.234.0.1;
    option broadcast-address 192.234.0.255;
    option domain-name-servers 192.234.1.203;
}

subnet 192.234.1.0 netmask 255.255.255.128 {
    range 192.234.1.2 192.234.1.126;
    option routers 192.234.1.1;
    option broadcast-address 192.234.1.127;
    option domain-name-servers 192.234.1.203;
}

subnet 192.234.1.128 netmask 255.255.255.192 {
    range 192.234.1.130 192.234.1.190;
    option routers 192.234.1.129;
    option broadcast-address 192.234.1.191;
    option domain-name-servers 192.234.1.203;
}

subnet 192.234.1.192 netmask 255.255.255.248 {
    range 192.234.1.194 192.234.1.198;
    option routers 192.234.1.193;
    option broadcast-address 192.234.1.199;
    option domain-name-servers 192.234.1.203;
}
EOF

echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server

service isc-dhcp-server restart
service isc-dhcp-server status
```
**Jalankan Script**
```
chmod +x /root/vilya.sh && /root/vilya.sh
```

---

### NARYA (DNS Server)

```bash
auto eth0
iface eth0 inet static
address 192.234.1.203
netmask 255.255.255.248
gateway 192.234.1.201

up echo "nameserver 8.8.8.8" > /etc/resolv.conf
up echo "nameserver 1.1.1.1" >> /etc/resolv.conf
```

**Script**
```bash
#!/bin/bash

apt-get update
apt-get install bind9 bind9-dnsutils bind9-utils -y

# Direktori zona
mkdir -p /etc/bind/k46
mkdir -p /run/named
chown bind:bind /run/named

# ===== named.conf.options =====
cat > /etc/bind/named.conf.options << 'EOF'
options {
    directory "/var/cache/bind";
    pid-file "/run/named/named.pid";
    session-keyfile "/run/named/session.key";

    forwarders {
        8.8.8.8;
        1.1.1.1;
    };

    allow-query { any; };
    allow-recursion { any; };

    dnssec-validation no;
    auth-nxdomain no;
    listen-on-v6 { any; };
};
EOF

# ===== named.conf.local =====
cat > /etc/bind/named.conf.local << 'EOF'
zone "k46.com" {
    type master;
    file "/etc/bind/k46/k46.com";
};
EOF

# ===== ZONE FILE =====
cat > /etc/bind/k46/k46.com << 'EOF'
$TTL 604800
@       IN      SOA ns1.k46.com. admin.k46.com. (
                        2025012102
                        604800
                        86400
                        2419200
                        604800 )

@       IN      NS      ns1.k46.com.

ns1     IN      A       192.234.1.203

ironhills   IN  A   192.234.1.218
palantir    IN  A   192.234.1.238
EOF

# Permission zone
chown -R bind:bind /etc/bind/k46

# ===== Start named secara manual (tanpa systemctl) =====
echo "Starting named daemon..."
pkill named 2>/dev/null

/usr/sbin/named -u bind -c /etc/bind/named.conf

echo "BIND started!"
```
**Jalankan Script**
```
chmod +x /root/narya.sh && /root/narya.sh
```

---

### IRONHILLS (Web Server)

```bash
auto eth0
iface eth0 inet static
address 192.234.1.218
netmask 255.255.255.252
gateway 192.234.1.217

up echo "nameserver 8.8.8.8" > /etc/resolv.conf
up echo "nameserver 1.1.1.1" >> /etc/resolv.conf
```

**Script**
```bash
echo "nameserver 192.234.1.203" > /etc/resolv.conf

apt-get update
apt-get install nginx -y
apt-get install lynx -y

# Matikan apache kalau ada
service apache2 stop 2>/dev/null
update-rc.d apache2 disable 2>/dev/null

# Enable nginx service
update-rc.d nginx defaults

# Buat folder web
mkdir -p /var/www/ironhills

# Isi halaman web
echo "<h1>WELCOME TO IRONHILLS</h1>" > /var/www/ironhills/index.html

# Hapus default site
rm -f /etc/nginx/sites-enabled/default
rm -f /etc/nginx/sites-available/default

# Buat virtual host nginx
cat > /etc/nginx/sites-available/ironhills << 'EOF'
server {
    listen 80;
    server_name ironhills.k46.com;

    root /var/www/ironhills;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
EOF

# Enable site
ln -sf /etc/nginx/sites-available/ironhills /etc/nginx/sites-enabled/

# Test config
nginx -t

# Restart nginx via service
service nginx restart

echo "=== IRONHILLS WEB SERVER READY ==="
service nginx status
```
**Jalankan Script**
```
chmod +x /root/ironhills.sh && /root/ironhills.sh
```

---

### PALANTIR (Web Server)

```bash
auto eth0
iface eth0 inet static
address 192.234.1.238
netmask 255.255.255.252
gateway 192.234.1.237

up echo "nameserver 8.8.8.8" > /etc/resolv.conf
up echo "nameserver 1.1.1.1" >> /etc/resolv.conf
```

**Script**
```bash
echo "nameserver 192.234.1.203" > /etc/resolv.conf

apt-get update
apt-get install nginx -y
apt-get install lynx -y

# Matikan apache kalau ada
service apache2 stop 2>/dev/null
update-rc.d apache2 disable 2>/dev/null

# Enable nginx service
update-rc.d nginx defaults

# Buat folder web
mkdir -p /var/www/palantir

# Isi halaman web
echo "<h1>WELCOME TO PALANTIR</h1>" > /var/www/palantir/index.html

# Hapus default site
rm -f /etc/nginx/sites-enabled/default
rm -f /etc/nginx/sites-available/default

# Buat virtual host nginx
cat > /etc/nginx/sites-available/palantir << 'EOF'
server {
    listen 80;
    server_name palantir.k46.com;

    root /var/www/palantir;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
EOF

# Enable site
ln -sf /etc/nginx/sites-available/palantir /etc/nginx/sites-enabled/

# Test config
nginx -t

# Restart nginx via service
service nginx restart

echo "=== PALANTIR WEB SERVER READY ==="
service nginx status
```
**Jalankan Script**
```
chmod +x /root/palantir.sh && /root/palantir.sh
```

---

## KONFIGURASI CLIENT (DHCP)

### Semua Client (Elendil, Isildur, Gilgalad, Cirdan, Durin, Khamul)

```bash
auto eth0
iface eth0 inet dhcp
```

**Setelah mendapat IP:**
```bash
echo "nameserver 192.234.1.203" > /etc/resolv.conf
```

---
## TESTING
### Test 1: TESTING ROUTING / KONEKTIVITAS
1. Test koneksi antar router utama
Dari Osgilliath
```
ping 192.234.1.210   # Rivendell
ping 192.234.1.214   # Moria
ping 192.234.1.226   # Minastir
```
<img width="382" height="337" alt="image" src="https://github.com/user-attachments/assets/70b6771f-af26-48d0-ac28-022d6cbfff8f" />

2. Test koneksi dari router ke server
Dari Moria:
```
ping 192.234.1.218   # IronHills
```
<img width="444" height="128" alt="image" src="https://github.com/user-attachments/assets/7afe2b96-5b6d-4ca2-acfd-15769b8ddd94" />

Dari Pelargir:
```
ping 192.234.1.238   # Palantir
```
<img width="382" height="106" alt="image" src="https://github.com/user-attachments/assets/fd1595c7-98b7-4eed-82e5-f3ce9423b773" />

3. Test koneksi router ke DHCP server Vilya
Dari Rivendell:
```
ping 192.234.1.202
```
<img width="379" height="104" alt="image" src="https://github.com/user-attachments/assets/b1a0ad73-a756-408b-981e-5457dc769cfa" />

Dari Minastir:
```
ping 192.234.1.202
```
<img width="377" height="104" alt="image" src="https://github.com/user-attachments/assets/88ef6661-209e-4937-bfa2-7a34468d2044" />

Dari Wilderland:
```
ping 192.234.1.202
```
<img width="375" height="104" alt="image" src="https://github.com/user-attachments/assets/e4cdfa99-f34a-4ff4-adb0-954da336599b" />

4. Test koneksi dari semua subnet client ke Internet
Dari Client (contoh Elendil / Gilgalad / Durin):
```
ping 8.8.8.8
```
<img width="352" height="95" alt="image" src="https://github.com/user-attachments/assets/39759c08-e5b0-4043-9664-3bef51e499c2" />

### Test 2: TESTING DHCP SERVER + RELAY
Di Rivendell
```
cat /etc/default/isc-dhcp-relay
```
<img width="299" height="43" alt="image" src="https://github.com/user-attachments/assets/5add35db-f003-4bf5-a87e-ded3739d1d51" />

Lakukan hal yang sama untuk: `Wilderland`, `Minastir`, `AnduinBanks`.

### Test 3: TESTING DNS SERVER NARYA
```
dig ironhills.k46.com @192.234.1.203
dig palantir.k46.com @192.234.1.203
```
<img width="409" height="460" alt="image" src="https://github.com/user-attachments/assets/f95e7d2d-6504-4097-b5bf-3bb2e696f599" />

### Test 4: TESTING WEB SERVER PALANTIR & IRONHILLS
1. Test akses via IP
Dari client:
```
lynx http://192.234.1.218
lynx http://192.234.1.238
```
2. Test akses via domain
```
lynx http://ironhills.k46.com
lynx http://palantir.k46.com
```

## Misi 2 (Security Rules)
Agar jaringan aman, terapkan aturan firewall berikut. 

> 1. Agar jaringan Aliansi bisa terhubung ke luar (Valinor/Internet), konfigurasi routing menggunakan iptables.
    Syarat: Kalian TIDAK DIPERBOLEHKAN menggunakan target MASQUERADE. 

Di Osgilliath:
```
iptables -t nat -A POSTROUTING -s 192.234.0.0/16 -o eth0 -j SNAT --to-source <IP-Osgilliath>
```

Dari client:
```
ping 8.8.8.8
lynx http://google.com
```
<img width="347" height="86" alt="image" src="https://github.com/user-attachments/assets/669c7d98-f035-4a1c-a651-cae9c31f855d" />

Jika bisa → NAT sukses.

> 2. Karena Vilya (DHCP) menyimpan data vital, pastikan tidak ada perangkat lain yang bisa melakukan PING ke Vilya.
    Namun, Vilya tetap leluasa dapat mengakses/ping ke seluruh perangkat lain.

Di Osgiliath jalankan :

        iptables -I FORWARD -d 192.234.1.202 -p icmp --icmp-type 8 -j REJECT

Cek di Vilya (Harus berhasil) :

        ping -c 3 192.234.1.238   # ping Palantir

Lalu cek dari host lain (Harus gagal) :

        ping -c 3 192.234.1.202

Hapus aturan tadi jika sudah selesai :

        iptables -D FORWARD -d 192.234.1.202 -p icmp --icmp-type 8 -j REJECT

> 3. Agar lokasi pasukan tidak bocor, hanya Vilya yang dapat mengakses Narya (DNS).
    Gunakan nc (netcat) untuk memastikan akses port DNS (53) ini.
    [Hapus aturan ini setelah pengujian agar internet lancar untuk install paket]

Jalankan script berikut di Narya :

        #!/bin/sh
        
        # flush rules for DNS port specific chain
        iptables -N DNS_ONLY 2>/dev/null || true
        iptables -F DNS_ONLY
        
        # allow loopback and local
        iptables -A DNS_ONLY -i lo -j ACCEPT
        
        # allow from VILYA
        iptables -A DNS_ONLY -s 192.234.1.202 -p udp --dport 53 -j ACCEPT
        iptables -A DNS_ONLY -s 192.234.1.202 -p tcp --dport 53 -j ACCEPT
        
        # drop others to port 53
        iptables -A DNS_ONLY -p udp --dport 53 -j REJECT
        iptables -A DNS_ONLY -p tcp --dport 53 -j REJECT
        
        # insert DNS_ONLY into INPUT chain before generic ACCEPTs
        iptables -I INPUT 1 -j DNS_ONLY

Cek di Vilya (harus berhasil) :

        apt-get install netcat-traditional
        echo | nc -u 192.234.1.203 53 -w 2
        atau
        echo | nc 192.234.1.203 53 -w 2

Di host lain cek juga (harus gagal) :

        apt-get install netcat-traditional
        echo | nc -u 192.234.1.203 53 -w 2

Untuk mengembalikan ke awal :

        iptables -D INPUT -j DNS_ONLY
        iptables -F DNS_ONLY
        iptables -X DNS_ONLY

> 4. Aktivitas mencurigakan terdeteksi di IronHills. Berdasarkan dekrit Raja, IronHills hanya boleh diakses pada Akhir Pekan (Sabtu & Minggu).
    Akses hanya diizinkan untuk Faksi Kurcaci & Pengkhianat (Durin & Khamul) serta Faksi Manusia (Elendil & Isildur).
    Karena hari ini adalah Rabu (Simulasikan waktu server), mereka harusnya tertolak. Gunakan curl untuk membuktikan blokir waktu ini.

Gunakan script berikut di IronHills :

        #!/bin/sh
        
        # flush any existing time-based rules we might add
        # (we will add specific rules for TCP port 80 and 443)
        iptables -N ALLOW_WEEKEND 2>/dev/null || true
        iptables -F ALLOW_WEEKEND
        
        # Allow on Sat & Sun only for allowed sources -> ACCEPT
        iptables -A ALLOW_WEEKEND -p tcp -m multiport --dports 80,443 -s 192.234.1.192/29 -m time --weekdays Sat,Sun --kerneltz -j ACCEPT
        iptables -A ALLOW_WEEKEND -p tcp -m multiport --dports 80,443 -s 192.234.1.192/29 -m time --weekdays Sat,Sun --kerneltz -j ACCEPT
        iptables -A ALLOW_WEEKEND -p tcp -m multiport --dports 80,443 -s 192.234.1.0/25 -m time --weekdays Sat,Sun --kerneltz -j ACCEPT
        
        # Otherwise REJECT attempts to web ports
        iptables -A ALLOW_WEEKEND -p tcp -m multiport --dports 80,443 -j REJECT --reject-with tcp-reset
        
        # put chain at top of INPUT (so it takes precedence)
        iptables -I INPUT 1 -j ALLOW_WEEKEND

Untuk membuktikan penolakan bisa menggunakan berikut :

        date -s "2025-12-03 09:00:00"
        curl -I http://192.234.1.218 -m 5

Jika ingin simulasi untuk hari Sabtu :

        date -s "2025-12-06 09:00:00"
        curl -I http://192.234.1.218 -m 5

Untuk mengembalikan ke awal :

        iptables -D INPUT -j ALLOW_WEEKEND
        iptables -F ALLOW_WEEKEND
        iptables -X ALLOW_WEEKEND

> 5. Sembari menunggu, pasukan berlatih di server Palantir. Akses dibatasi berdasarkan ras:
    Faksi Elf (Gilgalad & Cirdan): Boleh akses jam 07.00 - 15.00.
    Faksi Manusia (Elendil & Isildur): Boleh akses jam 17.00 - 23.00.
    Gunakan curl untuk memastikan akses sesuai jam.

Run script berikut di Palantir :

        #!/bin/sh
        
        iptables -N TIME_ACCESS 2>/dev/null || true
        iptables -F TIME_ACCESS
        
        # Allow ELF 07:00-15:00 (every day)
        iptables -A TIME_ACCESS -p tcp --dport 80 -s 192.234.1.128/26 -m time --timestart 07:00 --timestop 15:00 --kerneltz -j ACCEPT
        
        # Allow HUMAN 17:00-23:00
        iptables -A TIME_ACCESS -p tcp --dport 80 -s 192.234.1.0/25 -m time --timestart 17:00 --timestop 23:00 --kerneltz -j ACCEPT
        
        # Otherwise reject to port 80
        iptables -A TIME_ACCESS -p tcp --dport 80 -j REJECT --reject-with tcp-reset
        
        # Insert at top
        iptables -I INPUT 1 -j TIME_ACCESS

Untuk cek jam 9 pagi :

        date -s "2025-12-06 09:00:00"
        curl -I http://192.234.1.238 -m 5

Untuk cek jam 18 malam :
        
        date -s "2025-12-06 18:00:00"
        curl -I http://192.234.1.238 -m 5

Untuk cek jam 1 pagi :

        date -s "2025-12-06 01:00:00"
        curl -I http://192.234.1.238 -m 5

Untuk kembali ke awal :

        iptables -D INPUT -j TIME_ACCESS
        iptables -F TIME_ACCESS
        iptables -X TIME_ACCESS

> 6. Pasukan Manusia (Elendil) diminta menguji keamanan Palantir. Lakukan simulasi port scan dengan nmap rentang port 1-100.
    a. Web server harus memblokir scan port yang melebihi 15 port dalam waktu 20 detik.
    b. Penyerang yang terblokir tidak dapat melakukan ping, nc, atau curl ke Palantir.
    c. Catat log iptables dengan prefix "PORT_SCAN_DETECTED".

Jalankan script berikut di Palantir :

        #!/bin/sh
        
        # create chain
        iptables -N PORTSCAN_CHECK 2>/dev/null || true
        iptables -F PORTSCAN_CHECK
        
        # if IP already blacklisted (BLOCKLIST), drop everything
        iptables -I INPUT 1 -m recent --rcheck --name PORT_BLOCK --seconds 3600 -j DROP
        
        # track NEW attempts to ports 1-100 and record source into RECENT list "PSCAN"
        iptables -A PORTSCAN_CHECK -p tcp -m state --state NEW --dport 1:100 -m recent --set --name PSCAN --rsource
        
        # if source has hitcount >=16 within 20s, move to BLOCK list and log & drop
        iptables -A PORTSCAN_CHECK -p tcp -m state --state NEW --dport 1:100 -m recent --update --seconds 20 --hitcount 16 --name PSCAN --rsource -j PORTSCAN_BLOCK
        
        # default: accept other NEW connection attempts to 1:100 (normal)
        iptables -A PORTSCAN_CHECK -p tcp -m state --state NEW --dport 1:100 -j ACCEPT
        
        # chain to perform block action
        iptables -N PORTSCAN_BLOCK 2>/dev/null || true
        iptables -F PORTSCAN_BLOCK
        # set into BLOCK list for long period (3600s)
        iptables -A PORTSCAN_BLOCK -m recent --set --name PORT_BLOCK --rsource
        # log with the required prefix
        iptables -A PORTSCAN_BLOCK -j LOG --log-prefix "PORT_SCAN_DETECTED: " --log-level 4
        # then drop
        iptables -A PORTSCAN_BLOCK -j DROP
        
        # insert PORTSCAN_CHECK early so port scans are detected before normal accept
        iptables -I INPUT 1 -j PORTSCAN_CHECK

Di Elendil lakukan uji keamanan pada Palantir :

        nmap -p1-100 192.234.1.238

Setelah diblokir, laukan ping atau curl :

        ping -c 3 192.234.1.238
        curl -I http://192.234.1.238 -m 3

Lalu cek log Palantir lewat :

        # look for prefix in kernel log
        dmesg | grep "PORT_SCAN_DETECTED" -n
        atau
        grep "PORT_SCAN_DETECTED" /var/log/syslog || true

Untuk menghapus aturan :

        # remove blocklist entry for attacker IP e.g. 192.234.0.55
        iptables -m recent --remove --name PORT_BLOCK --rsource --remove 192.234.0.55 2>/dev/null || true
        
        # Remove all rules installed:
        iptables -D INPUT -j PORTSCAN_CHECK
        iptables -F PORTSCAN_CHECK
        iptables -X PORTSCAN_CHECK
        iptables -F PORTSCAN_BLOCK
        iptables -X PORTSCAN_BLOCK

> 7. Hari Sabtu tiba. Akses ke IronHills dibatasi untuk mencegah overload.
    Akses ke IronHills hanya boleh berasal dari 3 koneksi aktif per IP dalam waktu bersamaan.
    Lakukan uji coba beban (stress test) menggunakan curl atau ab.

Jalankan script berikut di IronHills :

        #!/bin/sh
        
        # create chain
        iptables -N CONNLIMIT_CHECK 2>/dev/null || true
        iptables -F CONNLIMIT_CHECK
        
        # apply only on Sat (for test you can change date or remove time match)
        iptables -A CONNLIMIT_CHECK -p tcp --dport 80 -m connlimit --connlimit-above 3 --connlimit-mask 32 -j REJECT --reject-with tcp-reset
        
        # insert into INPUT
        iptables -I INPUT 1 -j CONNLIMIT_CHECK

Untuk melakukan stress test coba lakukan berikut di Elendil :

        for i in $(seq 1 6); do (curl -sS http://192.234.1.218 &); done

Untuk menghapus aturan tadi, gunakan berikut di IronHills :

        iptables -D INPUT -j CONNLIMIT_CHECK
        iptables -F CONNLIMIT_CHECK
        iptables -X CONNLIMIT_CHECK

> 8. Selama uji coba, terdeteksi anomali. Setiap paket yang dikirim Vilya menuju Khamul, ternyata dibelokkan oleh sihir hitam menuju IronHills.
    Gunakan nc untuk memastikan alur pengalihan ini (Redirect trafik dari Client ke Server).

Jalankan berikut di Osgiliath :

        iptables -t nat -A PREROUTING -s 192.234.1.202 -d 192.234.1.0/25 -p tcp --dport 80 -j DNAT --to-destination 192.234.1.218
        iptables -I FORWARD -d 192.234.1.218 -p tcp --dport 80 -j ACCEPT

Lalu di IronHills cek pengalihan dengan :

        apt-get install netcat-traditional
        nc -l 9999

Lalu dari Vilya, lakukan berikut dan cek IronHills apakah terjadi pengalihan atau tidak :

        apt-get install netcat-traditional
        echo "hello" | nc 192.234.1.193 80 -w 2

Untuk mengembalikan aturan di Osgiliath :

        iptables -t nat -D PREROUTING -s 192.234.1.202 -d 192.234.1.192/26 -p tcp --dport 80 -j DNAT --to-destination 192.234.1.218
        iptables -D FORWARD -d 192.234.1.218 -p tcp --dport 80 -j ACCEPT

## Misi 3

> 1. Penjara Barad-dûr: Mengetahui pengkhianatan Khamul, Aliansi mengambil langkah final: Blokir semua lalu lintas masuk dan keluar dari Khamul.
    Gunakan nc dan ping untuk membuktikan Khamul terisolasi total.
    Penting: Yang diblokir adalah Khamul (5 Host), BUKAN Durin (50 Host). Jangan sampai salah sasaran.

Jalankan berikut di Wilderland :

        iptables -I FORWARD 1 -s 192.234.1.0/25 -j DROP
        iptables -I FORWARD 1 -d 192.234.1.0/25 -j DROP

Lalu cek dengan berikut di node lain (Harus gagal) :

        ping -c 3 192.234.1.193
        apt-get install netcat-traditional
        nc -vz 192.234.1.193 22   

Di Khamul cek bahwa terblokir atau tidak :

        ping -c 3 8.8.8.8
        apt-get install netcat-traditional
        nc -vz 192.234.1.238 80   

Untuk mengembalikan ke aturan awal di Wilderland :

        iptables -D FORWARD -s 192.234.1.192/26 -j DROP
        iptables -D FORWARD -d 192.234.1.192/26 -j DROP
        iptables -t nat -D PREROUTING -d 192.234.1.192/26 -j DROP
        iptables -t nat -D PREROUTING -s 192.234.1.192/26 -j DROP
