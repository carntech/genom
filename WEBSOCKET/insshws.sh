#!/bin/bash
# Proxy For Edukasi & Imclass



wget -O /usr/local/bin/ssh-wsenabler https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ssh-wsenabler
wget -O /usr/local/bin/proxy3.js https://raw.githubusercontent.com/carntech/genom/refs/heads/main/SYSTEM/proxy3.js
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-dropbear
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-stunnel
wget -O /usr/local/bin/ws-openssh https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-openssh
wget -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-ovpn
wget -O /usr/local/bin/ws-ovpn.service https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-ovpn.service
wget -O /usr/local/bin/ws-dropbear.service https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-dropbear.service
wget -O /usr/local/bin/ws-stunnel.service https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-stunnel.service
wget -O /usr/local/bin/ws-openssh.service https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-openssh.service
sleep 1
chmod +x /usr/bin/ssh-wsenabler
chmod +x /usr/bin/proxy3.js
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
chmod +x /usr/local/bin/ws-openssh
chmod +x /etc/systemd/system/ws-dropbear.service
chmod +x /etc/systemd/system/ws-stunnel.service
chmod +x /etc/systemd/system/ws-openssh.service
sleep 1
sudo systemctl daemon-reload
sudo systemctl enable ws-dropbear.service
sudo systemctl start ws-dropbear.service
sudo systemctl restart ws-dropbear.service
sudo systemctl enable ws-stunnel.service
sudo systemctl start ws-stunnel.service
sudo systemctl restart ws-stunnel.service
sudo systemctl enable ws-openssh.service
sudo systemctl start ws-openssh.service
sudo systemctl restart ws-openssh.service
sudo systemctl enable ws-ovpn.service
sudo systemctl start ws-ovpn.service
sudo systemctl restart ws-ovpn.service

cat <<EOF > /etc/systemd/system/ws-nontls.service
[Unit]
Description=WSenabler
Documentation=By Carntech

[Service]
Type=simple
ExecStart=/usr/bin/ssh-wsenabler
KillMode=process
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
EOF
chmod +x /etc/systemd/system/ws-nontls.service
sudo systemctl daemon-reload
sudo systemctl enable ws-nontls.service
sudo systemctl start ws-nontls.service
sudo systemctl restart ws-nontls.service >/dev/null 2>&1
sudo service ws-nontls.service restart

#RESPONSE = 'HTTP/1.1 101 WebSocket <font color="lime"> Carntech </font><font color="yellow"> . </font><font color="red"> Cloudfront</font>\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: foo\r\n\r\n'
#RESPONSE = 'HTTP/1.1 101 WebSocket <font color="lime"> Carntech </font><font color="yellow"> . </font><font color="red"> Cloudfront </font>\r\nContent-Length: 104857600000\r\n\r\n'

