# Veracrypt @ local mediaserver

### Installation
```bash
wget https://raw.githubusercontent.com/leongross/veracrypt_media_server/master/install.sh | sh
```

```bash
git clone https://github.com/leongross/veracrypt_media_server.git
cd ./veracrypt_media_server/
chmod +x ./install.sh && ./install.sh
```

### Usage
Mount and decrypt volumes
```bash
sudo ./vera_mount.sh
```
Unmount and encrypt volumes
```bash
sudo ./vera_umount
```

On correct execution the output should look similliar to this:
``` bash
[*] vera_key_dev = 00873066-01
[*] vera_media_dev = 0e6fb5b6-4908-4461-aafd-d222d1d028c8
[+] Key device : /dev/sda1
[+] Media device : /dev/sdb2
[+] Mountpoint /mnt/vera_key already exists
[+] Mountpoint /mnt/vera_media already exists
[+] Starting volume decryption ...
[+] Successfully decrypted and mounted volume
[+] Samba service running
```
If you intent to use my project make sure to change the following entries in `vera_mount.sh`
```bash
# device uuids
vera_key_PARTUUID="your_key_partition_id"
vera_media_PARTUUID="your_encrypted_partition_id"
```

The `systemd` module `vera_media_server.service` is currently not working properly, do not rely on it.

The script `stats.sh` shows *general* statictics about the sever, it is unrelated to veracrypt
```bash
[*] Active SSH connections: 2
[*] Mounted Vera Volumes: /dev/sdb2 -> /mnt/vera_media
[+] Apache2 Service Up
[*] Docker containers active: 0
[+] Samba Server Up
[*] IP's connected via samba:    192.168.178.20
```
Using `stats_n.sh` instead of `stats.sh` gives you the ability so host a minimal website containing `stats.sh` output updated every 2 seconds.

```bash
./stats_n.sh 8888
```
