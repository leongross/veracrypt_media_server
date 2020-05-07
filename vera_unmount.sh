#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
	printf "[-] Root permissions needed\n"
	exit 1
fi

printf "[*] Starting veracrypt auto volume unmount \n"

# stop samba server ( else resource is busy )
sudo service smbd stop 2>/dev/null && printf "[+] Stopped samba server\n" || printf "[-] Error stopping samba server\n"
mountpoint -q "/mnt/vera_key" && sudo umount /mnt/vera_key && printf "[+] Unmounted keyfile device \n" || printf "[-] Error unmounting keyfile device \n"

# the script will not distinguish any partitions but unmount all
veracrypt -d 2>/dev/null && printf "[+] Successfully unmounted volumes\n" || printf "[-] Error unmountung veracrypt volume. Stop services like samba\n"

