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
# Getting Proxy Template
wget -q -O /usr/local/bin/websocket https://raw.githubusercontent.com/rockneters/rockvpn/main/websocket/websocket.py
chmod +x /usr/local/bin/websocket

# Installing Service
cat > /etc/systemd/system/websocket.service << END
[Unit]
Description=Python Proxy Mod By RocknetZ
Documentation=https://github.com/RocknetZ/mon
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/websocket 8880
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/rockneters/rockvpn/main/websocket/ws-ovpn.py
chmod +x /usr/local/bin/ws-ovpn

# Installing Service
cat > /etc/systemd/system/ws-ovpn.service << END
[Unit]
Description=Python Proxy Mod By RocknetZ
Documentation=https://github.com/RocknetZ/mon
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn 2086
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Installing Service ws-stunnel
wget -q -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/rockneters/rockvpn/main/websocket/ws-stunnel
chmod +x /usr/local/bin/ws-stunnel

# Create system Service ws-stunnel
cat > /etc/systemd/system/ws-stunnel.service <<END
[Unit]
Description=Python Proxy Mod By RocknetZ
Documentation=https://github.com/RocknetZ/mon
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-stunnel 445
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable websocket
systemctl restart websocket
systemctl enable ws-ovpn
systemctl restart ws-ovpn
systemctl enable ws-stunnel
systemctl restart ws-stunnel
