#!/bin/sh

function printHelp(){
echo 'Usage: '
echo '-h	prints this message'
echo '-f	force restart'
}
#if -f is used, don't check current connection
skipNetCheck=0
while getopts "fh" OPTION; do
    case $OPTION in
    h)
	printHelp
	exit 1;
        ;;
    f)
	skipNetCheck=1
        ;;
    *)
	printHelp
        exit 1
        ;;
    esac
done

if [ $skipNetCheck -eq 0 ]
then
	ping -c 1 google.com > /dev/null 2>&1
	if [ $? -eq 0 ] 
	then
		echo 'Internet connection is OK, exiting!'
		exit 1
	fi
fi

echo 'kill wpa_supplicant and dhcpcd'
sudo killall -s 2 wpa_supplicant
sudo killall -s 2 dhcpcd
#send exit message to all dhcpcd
#dhcpcd -x

#check if these processes died
cnt=0;
for (( ; ; ))
do
	isAlive=$(ps aux | grep -P "(wpa_supplicant|dhcpcd)" | wc -l)
	if [ $isAlive -eq 1 ]
	then
		echo 'kill succesful'
		break;
	else
		cnt+=1
		if [ $cnt -gt 10 ]
		then
			echo 'kill unsuccesful'
			exit 0
		fi
		sleep 1;
	fi
done

WIFI=$(cat /etc/wpa_supplicant/selected)
echo 'restart wifi: ' $WIFI
sudo wpa_supplicant -B -i wlp2s0 -c /etc/wpa_supplicant/$WIFI.conf 
sudo dhcpcd wlp2s0 &
sudo dhcpcd enp8s0

ping -c 1 google.com > /dev/null 2>&1
if [ $? -eq 0 ] 
then
	echo 'Succesful!'
	exit 1
else
	echo 'Failed!'
	exit 0
fi
