#!/bin/sh

# check if root
if [ $(id -u) -ne 0 ];then
  	printf "[-] You must be root\n"
	exit 1
fi       

printf "[*] Active SSH connections: $(ss | grep -i ssh | wc -l)\n"
printf "[*] Mounted Vera Volumes: $(veracrypt -l  2>/dev/null | awk '{print $2 " -> " $4 }')\n"
service apache2 status 1>/dev/null && printf "[+] Apache2 Service Up\n" || printf "[-] Apache2 Service Down\n"
printf "[*] Docker containers active: $(docker container ls --quiet | wc -l)\n"
service smbd status 1>/dev/null && printf "[+] Samba Server Up\n" || printf "[-] Samba Server Down\n" 
printf "[*] IP's connected via samba: \t $(sudo smbstatus --shares | sed 1,3d | tr -d '\n' | awk {' print $3'} | tr -d '\n' | sort | uniq ) \n"
