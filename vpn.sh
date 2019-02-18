#!/bin/bash

#a script to run a random vpn server from a folder

if [ $EUID != 0 ]; then
	echo "This program needs to run with sudo"
	exit;
fi
#loops retrying random numbers until it find a file with number 
while [ TRUE ]; do
	#directory where the files are located
	path=/etc/openvpn/ovpn_udp/us
	#picks a number in the range of server files I have
	num=$(shuf -r -n 1 -i 349-3120)
	#The line below assumes that there won't be multiple files with the similar names... 	
	file=$path$num$end*
	if [ -e $file ]; then
		#if the file is found, print out the file used
		echo $file
		#and run the vpn command
		sudo openvpn --config $file --daemon
		exit;
	fi
done
