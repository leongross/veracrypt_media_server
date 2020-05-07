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
```bash
sudo ./vera_decrypt.sh
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
If you really intent to use my project make sure to change the following entries in `vera_decrypt.sh`
```bash
# device uuids
vera_key_PARTUUID="your_key_partition_id"
vera_media_PARTUUID="your_encrypted_partition_id"
```
