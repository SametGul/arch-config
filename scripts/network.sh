#!/bin/sh
i3-msg floating enable > /dev/null
echo 'WiFi Connection Tool'
interface=$(iw dev | grep Interface  | cut -d ' ' -f 2)
if [[ $(echo $interface | wc -l) -ne 1 ]]; then
	selected=$(echo $interface | dmenu -p 'select interface:')
else 
	selected=$interface
fi
sudo ip link set $selected up

channels=$(sudo iw dev $selected scan | grep SSID | sort -u | cut -d ' ' -f 2)
echo 'Select channel from menu'
selected_channel=$(echo "$channels" | dmenu -p 'select channel:')

conf=/etc/wpa_supplicant/$selected_channel.conf
echo $conf
if [[ -e $conf ]]; then
	echo 'conf file exist connect now!'
else
	echo 'Enter pass phrase of ' $selected_channel
	read pass
	if [ -z "$pass" ]
	then
		echo 'Empty password, exiting!'
		exit 0
	fi
	wpa_passphrase $selected_channel $pass > $conf
	echo 'create conf file'
fi
echo $selected_channel > /etc/wpa_supplicant/selected

echo 'connect now'
~/scripts/net_fix.sh -f
