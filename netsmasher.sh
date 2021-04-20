#!/bin/bash


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

printf "\n and this is your ip address!\n\n" 
myip 
