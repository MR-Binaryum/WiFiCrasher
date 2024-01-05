#!/bin/bash
 
green="\033[32;1m"
yellow="\033[33;1m"
red="\033[31;1m"
purple="\033[37;1m"
cyan="\033[36;1m"

echo ""
echo "put youre interface name in monitor mode in the next input"
                                        read -p "└─────►$(tput setaf 7) " interfaceMon


echo ""
echo "the exploits files gonna late 5 minutes to sniff all near networks to make street deauth attack please be pattient..."
echo ""

for chann in {1..13}; do
exitfile="generated_$chann"

sudo timeout 15s xterm -e airodump-ng -c $chann --output-format kismet --write $exitfile $interfaceMon >> /dev/null &&

echo "maked channel $chann file for street deauth exploit..."

sed -i '1d' generated_$chann-01.kismet.csv

echo "showing networks in channel $chann..."

echo ""
echo  "${Red}SerialNo        WiFi Channel${White}        WiFi Network${White}"
echo "---------------------------------------------------------------------------------------"
awk -F';' '{print "     " $6 "               " $3}' generated_$chann-01.kismet.csv  | nl -n ln -w 8


echo ""
echo "sending AP MAC addresses in channel $chann to export file..."
sleep 3
awk -F';' '{print "     " $4 }' generated_$chann-01.kismet.csv >> APs$chann.txt
sed -i '/BSSID/d' APs$chann.txt
echo ""
echo "showing MACs in channel $chann..."
echo ""
cat APs$chann.txt
echo ""
echo "Waiting before showing results in next hop channel..."

done

echo ""
echo "all configure files ready..."
