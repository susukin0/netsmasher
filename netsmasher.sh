#!/bin/bash

clear
banner (){

echo " _ __   __ _ ___ ___| |__  _   _| | _| |"
echo "| '_ \ / _  / __/ __  | '_ \| | | |  |/|"
echo "| |_) | (_| \__ \__ \ | | | |_| |   <|_|"
echo "| .__/ \__,_|___/___/_| |_|\__, |_|\_(_)"
echo "|_|                        |___/        "

}



function ip(){

arp -a | grep "(" | cut -d " " -f 2 | tr -d ")" | tr -d "(" 
}

function myip(){
ifconfig | grep "inet 192." | cut -c 13-26 
}

banner

 
printf "\n ips listed below are in your network!\n\n"
ip

printf "\n your ip is:\n\n" 
myip 

echo -e "\n\n[hit enter to continue] "
read -p ' ' ohayogosayumasu

scan(){
echo -e "\n ~do you want to also scan these fellows?~"
read -p $'THEN  yes/no >_: ' bakayaro
if [[ "$bakayaro" == "yes" ]]; then
        clear
        
        ip > scan.txt 
        echo -e "\n SCANNING ..."
        
        cat scan.txt
        echo -e "SCANNING ..."
        echo -e "\n\n[created a text file of ip addresses]\n "
        read -p '[hit enter to continue]' konichiwagosayumasu
        for ip in $(cat scan.txt);
        do nmap -p 80 -T4 $ip &
       
        
        read -p ' '
        done
    elif [[ "$bakayaro" == "no" ]]; then
        echo -e "LEAVING ..."

        exit 0
    else
            echo -e "\n INVALID VALUE!"
   	    scan
fi
}

scan
