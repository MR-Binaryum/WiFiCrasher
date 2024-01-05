echo "put youre interface name in monitor mode in the next input"
                                        read -p "└─────►$(tput setaf 7) " wifiInterfaceMon

crafter(){
for i in {1..100}; do
    sudo iw dev $wifiInterfaceMon interface add "mon$i" type monitor
    if [ $? -eq 0 ]; then
        echo "Interface mon$i crafted..."
    else
        echo "Error to craft interface mon$i."
    fi
done
}

deleter(){
for i in {1..100}; do
    sudo iw dev "mon$i" del
    if [ $? -eq 0 ]; then
        echo "Interface mon$i deleted..."
    else
        echo "Error to make mon$i..."
    fi
done
}


spooferVirt(){

file="FAKEMAList.txt"

mapfile -t mac_array < "$file"

numINT=100

for ((i=1; i<=$numINT; i++)); do

random=$((RANDOM % ${#mac_array[@]}))

sudo ip link set dev "mon$i" down


sudo ip link set dev "mon$i" address "${mac_array[$random]}"
sudo ip link set dev "mon$i" up

unset mac_array[$random] 
mac_array=("${mac_array[@]}")

done

}

echo    $purple"{"$cyan"1"$purple"}"$yellow"--"$green"Craft 15 virtual interfaces in monitor mode to attack multiple networks at the same time"
    echo    $purple"{"$cyan"2"$purple"}"$yellow"--"$green"Delete 15 virtual interfaces in monitor mode to attack multiple networks"
    echo    $purple"{"$cyan"3"$purple"}"$yellow"--"$green"Spoof MAC address from mon1..100 virtual interfaces"
    echo
        echo $purple "╭─"$green"Select configure mode (-_-) "$purple
            read -p " ╰─$ " selection

            if [ $selection -eq 1 ];
            then
               crafter

            elif [ $selection -eq 2 ];
            then
                deleter

            elif [ $selection -eq 3 ];
            then
                spooferVirt

else echo "brooo look this dude XD..."

fi
