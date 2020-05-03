#!/bin/sh
# run script with uid = 1

# device uuids
vera_key_PARTUUID="00873066-01"
vera_media_PARTUUID="0e6fb5b6-4908-4461-aafd-d222d1d028c8"

printf "[*] vera_key_dev = %s\n" $vera_key_PARTUUID 
printf "[*] vera_media_dev = %s\n" $vera_media_PARTUUID

# using veracrypt with keyfile and UUID
#ext_dev=$(sudo blkid | grep /dev/sd)

vera_key_dev=$(sudo blkid | grep /dev/sd | grep $vera_key_PARTUUID | awk '{ print $1}')
vera_media_dev=$(sudo blkid | grep /dev/sd | grep $vera_media_PARTUUID | awk '{ print $1}')

echo "[+] Key device : $vera_key_dev"
echo "[+] Media device : $vera_media_dev"

# secure mounting
[ -d /mnt/vera_key ] && printf "[+] Mountpoint /mnt/vera_key already exists\n" || sudo mkdir /mnt/vera_key
sudo mount -t vfat $vera_key_dev /mnt/vera_key || echo "[-] Could not mount device $vera_key_dev";

[ -d /mnt/vera_media ] && printf "[+] Mountpoint /mnt/vera_media already exists\n" || sudo mkdir /mnt/vera_media
#sudo mount $vera_media_dev /mnt/vera_media || echo "[-] Could not mount device $vera_media_dev";

# decrypting harddrive using key file
sudo veracrypt -m ro -k /mnt/vera_key/vera.key --pim=0 --non-interactive $vera_media_dev /mnt/vera_media/ && echo "[+] Successfully decrypted and mounted volume" || echo "[-] Error decrypting volume. See logs"; exit

# starting samba client
sudo service smbd status 1>/dev/null && echo "[+] Samba service running" || sudo service sbmd start;


