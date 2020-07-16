#!/bin/sh
RED='\033[0;31m'
GREEN='\033[0;32m'
YEL='\033[0;33m'
NC='\033[0m'

function info(){
	echo -e $YEL$1$NC
}
function err(){
	echo -e $RED$1$NC
}
function green(){
	echo -e $GREEN$1$NC
}

i3-msg floating enable > /dev/null
info 'WiFi Connection Tool'
interface=$(iw dev | grep Interface  | cut -d ' ' -f 2)
if [[ $(echo $interface | wc -l) -ne 1 ]]; then
	selected=$(echo $interface | dmenu -p 'select interface:')
else 
	selected=$interface
fi
sudo ip link set $selected up

channels=$(sudo iw dev $selected scan | grep SSID | sort -u | cut -d ' ' -f 2)
info 'Select channel from menu'
selected_channel=$(echo "$channels" | dmenu -p 'select channel:')

conf=/etc/wpa_supplicant/$selected_channel.conf
if [[ -e $conf ]]; then
	info 'conf file exist connect now!'
else
	green "Enter pass phrase of $selected_channel"
	read pass
	if [ -z "$pass" ]
	then
		err 'Empty password, exiting!'
		exit 0
	fi
	wpa_passphrase $selected_channel $pass > $conf
fi
echo $selected_channel > /etc/wpa_supplicant/selected

green 'connect now'
~/scripts/net_fix.sh -f
