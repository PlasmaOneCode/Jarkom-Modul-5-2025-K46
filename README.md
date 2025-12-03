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

## POHON VLSM


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
```

**Script**
```bash
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p

route add -net 192.234.1.128 netmask 255.255.255.192 gw 192.234.1.222
route add -net 192.234.1.192 netmask 255.255.255.248 gw 192.234.1.222
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
```

**Script**
```bash
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p
```

---

### ANDUINBANKS (DHCP Relay)

```bash
auto eth0
iface eth0 inet static
address 192.234.1.234
netmask 255.255.255.252
gateway 192.234.1.233
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

---

## KONFIGURASI SERVICE

### VILYA (DHCP Server)

```bash
auto eth0
iface eth0 inet static
address 192.234.1.202
netmask 255.255.255.248
gateway 192.234.1.201
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

---

### NARYA (DNS Server)

```bash
auto eth0
iface eth0 inet static
address 192.234.1.203
netmask 255.255.255.248
gateway 192.234.1.201
```

**Script**
```bash
apt-get update
apt-get install bind9 -y

cat > /etc/bind/named.conf.options << 'EOF'
options {
    directory "/var/cache/bind";
    
    forwarders {
        8.8.8.8;
        8.8.4.4;
    };
    
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};
EOF

service bind9 restart
service bind9 status
```

---

### IRONHILLS (Web Server)

```bash
auto eth0
iface eth0 inet static
address 192.234.1.218
netmask 255.255.255.252
gateway 192.234.1.217
```

**Script**
```bash
echo "nameserver 192.234.1.203" > /etc/resolv.conf

apt-get update
apt-get install apache2 -y

cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>IronHills</title>
</head>
<body>
    <h1>Welcome to IronHills</h1>
</body>
</html>
EOF

service apache2 start
```

---

### PALANTIR (Web Server)

```bash
auto eth0
iface eth0 inet static
address 192.234.1.238
netmask 255.255.255.252
gateway 192.234.1.237
```

**Script**
```bash
echo "nameserver 192.234.1.203" > /etc/resolv.conf

apt-get update
apt-get install apache2 -y

cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Palantir</title>
</head>
<body>
    <h1>Welcome to Palantir</h1>
</body>
</html>
EOF

service apache2 start
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

## Misi 2 (Security Rules)
Agar jaringan aman, terapkan aturan firewall berikut. 

    Agar jaringan Aliansi bisa terhubung ke luar (Valinor/Internet), konfigurasi routing menggunakan iptables.
    
    Syarat: Kalian TIDAK DIPERBOLEHKAN menggunakan target MASQUERADE. 

    Karena Vilya (DHCP) menyimpan data vital, pastikan tidak ada perangkat lain yang bisa melakukan PING ke Vilya.
    
    Namun, Vilya tetap leluasa dapat mengakses/ping ke seluruh perangkat lain.

    Agar lokasi pasukan tidak bocor, hanya Vilya yang dapat mengakses Narya (DNS).
    
    Gunakan nc (netcat) untuk memastikan akses port DNS (53) ini.
    [Hapus aturan ini setelah pengujian agar internet lancar untuk install paket]

    Aktivitas mencurigakan terdeteksi di IronHills. Berdasarkan dekrit Raja, IronHills hanya boleh diakses pada Akhir Pekan (Sabtu & Minggu).
    
    Akses hanya diizinkan untuk Faksi Kurcaci & Pengkhianat (Durin & Khamul) serta Faksi Manusia (Elendil & Isildur).
    Karena hari ini adalah Rabu (Simulasikan waktu server), mereka harusnya tertolak. Gunakan curl untuk membuktikan blokir waktu ini.

    Sembari menunggu, pasukan berlatih di server Palantir. Akses dibatasi berdasarkan ras:
    
    Faksi Elf (Gilgalad & Cirdan): Boleh akses jam 07.00 - 15.00.
    Faksi Manusia (Elendil & Isildur): Boleh akses jam 17.00 - 23.00.
    Gunakan curl untuk memastikan akses sesuai jam.

    Pasukan Manusia (Elendil) diminta menguji keamanan Palantir. Lakukan simulasi port scan dengan nmap rentang port 1-100.
    
    a. Web server harus memblokir scan port yang melebihi 15 port dalam waktu 20 detik.
    b. Penyerang yang terblokir tidak dapat melakukan ping, nc, atau curl ke Palantir.
    c. Catat log iptables dengan prefix "PORT_SCAN_DETECTED".

    Hari Sabtu tiba. Akses ke IronHills dibatasi untuk mencegah overload.
    
    Akses ke IronHills hanya boleh berasal dari 3 koneksi aktif per IP dalam waktu bersamaan.
    Lakukan uji coba beban (stress test) menggunakan curl atau ab.

    Selama uji coba, terdeteksi anomali. Setiap paket yang dikirim Vilya menuju Khamul, ternyata dibelokkan oleh sihir hitam menuju IronHills.
    
    Gunakan nc untuk memastikan alur pengalihan ini (Redirect trafik dari Client ke Server).


## Misi 3
    Penjara Barad-dûr: Mengetahui pengkhianatan Khamul, Aliansi mengambil langkah final: Blokir semua lalu lintas masuk dan keluar dari Khamul.
    Gunakan nc dan ping untuk membuktikan Khamul terisolasi total.
    Penting: Yang diblokir adalah Khamul (5 Host), BUKAN Durin (50 Host). Jangan sampai salah sasaran.
