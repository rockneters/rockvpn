#!/bin/bash
# My Telegram : https://t.me/RocknetStore
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

clear
source /var/lib/RocknetZ/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tr="$(cat /etc/xray/trojan.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/xray/trojan.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
read -p "Expired (Days) : " masaaktif
read -p "SNI (bug) : " sni
read -p "Subdomain (EXP : Rocknet Store.xyz. / Press Enter If Only Using Hosts) : " sub
dom=$sub$domain
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-trojan$/a\#&# '"$user na$exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/trojan.json
systemctl restart x-tr.service
trojanlink="trojan://${user}@${dom}:${tr}?sni=$sni#$user"
service cron restart
clear
IP=$(wget -qO- ipinfo.io/ip);
echo -e "================================="
echo -e "            XRAY TROJAN         " 
echo -e "================================="
echo -e "Remarks   : ${user}"
echo -e "IP/Host   : ${IP}"
echo -e "Domain    : ${domain}"
echo -e "SNI       : $sni"
echo -e "Subdomain : $dom"
echo -e "Port      : ${tr}"
echo -e "Key       : ${user}"
echo -e "================================="
echo -e "Link TR  : ${trojanlink}"
echo -e "================================="
echo -e "Created   : $hariini"
echo -e "Expired   : $exp"
echo -e "================================="
echo -e "Server By Rocknet Store"
