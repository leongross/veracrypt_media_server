#!/bin/sh
# stats_n.sh - displaying stats to newtork

if [ "$(id -u)" -ne 0 ] && [ $# -eq 1 ];then
	printf "[-] You must be root\n"
	printf "usage: ./stats_n.sh <port>\n"
	exit 1
fi

sudo watch ./stats.sh | nc -lvp $1 & 
