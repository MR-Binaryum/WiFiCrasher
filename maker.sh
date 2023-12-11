#!/bin/bash
 
green="\033[32;1m"
yellow="\033[33;1m"
red="\033[31;1m"
purple="\033[37;1m"
cyan="\033[36;1m"

echo ""
echo "put youre interface name in monitor mode in the next input"
                                        read -p "└─────►$(tput setaf 7) " interfaceMon


echo "the exploits files gonna late 5 minutes to sniff all near networks to make street deauth attack please be pattient..."
echo ""
for o in {1..15};do
sudo airodump-ng --output-format kismet --write generated $interfaceMon >> /dev/null &
sleep 14
done
echo maked $o files for street deauth exploit...
