#!/usr/bin/bash
echo "Give the port that you want to block"
read port
ufw deny $port/tcp
ufw deny $port/udp
ufw reload
ufw status
