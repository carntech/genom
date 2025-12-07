#!/bin/bash
# Proxy For Edukasi & Imclass



wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-dropbear
wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-dropbear.service
chmod +x /usr/local/bin/ws-dropbear
chmod +x /etc/systemd/system/ws-dropbear.service

# Installing Service
cat > /etc/systemd/system/ws-nontls.service << END
[Unit]
Description=Python Proxy Mod By carntech
Documentation=https://t.me/carntech
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python3 -O /usr/local/bin/ws-dropbear
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

sudo systemctl status ws.dropbear.service
sudo systemctl start ws.dropbear.service
sudo systemctl enable ws.dropbear.service
sudo systemctl restart ws-dropbear.service
sudo systemctl restart ws-nontls.service

wget -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-ovpn.py
wget -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-ovpn.service
chmod +x /usr/local/bin/ws-ovpn
chmod +x /etc/systemd/system/ws-ovpn.service

# Installing Service
cat > /etc/systemd/system/ws-nontls.service << END
[Unit]
Description=Python Proxy Mod By carntech
Documentation=https://t.me/carntech
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python3 -O /usr/local/bin/ws-ovpn 2086
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
systemctl enable ws-ovpn.service
systemctl restart ws-ovpn.service

wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-stunnel
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/carntech/genom/refs/heads/main/WEBSOCKET/ws-stunnel.service
chmod +x /usr/local/bin/ws-stunnel
chmod +x /etc/systemd/system/ws-stunnel.service

# Installing Service
cat > /etc/systemd/system/ws-nontls.service << END
[Unit]
Description=Python Proxy Mod By carntech
Documentation=https://t.me/carntech
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python3 -O /usr/local/bin/ws-stunnel
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
sudo systemctl restart ws-stunnel.service
systemctl daemon-reload
systemctl enable ws-nontls.service
systemctl start ws-nontls.service
systemctl restart ws-nontls.service