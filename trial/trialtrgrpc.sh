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

MYIP=$(curl -sS ipv4.icanhazip.com)
clear
MYIP=$(wget -qO- ipinfo.io/ip);
source /var/lib/RocknetZ/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tr="$(cat /etc/xray/trojangrpc.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')"
user=dev-`</dev/urandom tr -dc X-Z0-9 | head -c4`
exp=1
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "SNI (bug) : " sni
read -p "Subdomain (EXP : Rocknet Store.xyz. / Press Enter If Only Using Hosts) : " sub
dom=$sub$domain
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-trojan-grpc$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/trojangrpc.json
systemctl restart trojangrpc.service
trojanlink1="trojan://$uuid@$dom:${tr}?mode=gun&security=tls&type=grpc&serviceName=GunService&sni=${sni}#${user}"
service cron restart
clear

echo -e "======-Xray/TROJAN-GRPC-======"
echo -e "Remarks   : ${user}"
echo -e "IP/Host   : ${MYIP}"
echo -e "Domain    : ${domain}"
echo -e "Subdomain : $dom"
echo -e "Port      : ${tr}"
echo -e "Key       : ${user}"
echo -e "Password  : ${uuid}"
echo -e "=========================="
echo -e "Link TR  : ${trojanlink1}"
echo -e "=========================="
echo -e "Created   : $hariini"
echo -e "Expired   : $exp"
echo -e "=========================="
echo -e "Server By Rocknet Store"
