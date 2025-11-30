# Jarkom-Modul-5-2025-K46

===========[Kelompok 46]=============

Mutiara Diva Jaladitha - 5027241083

Abiyyu Raihan Putra Wikanto - 5027241042

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
