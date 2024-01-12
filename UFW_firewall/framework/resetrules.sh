#!/usr/bin/bash
ufw --force disable
ufw --force reset
cd /etc/ufw/
rm -rf *.rules.*
sleep 5;
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw --force enable
ufw reload
cd /opt/firewall
bash iptablesreset.sh
ufw --force enable
ufw --force disable
ufw --force enable
ufw status
