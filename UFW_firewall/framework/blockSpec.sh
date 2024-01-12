#!/usr/bin/bash
echo "Give the IP that you want to block"
read target
ufw deny from $target 
ufw reload
ufw status numbered
