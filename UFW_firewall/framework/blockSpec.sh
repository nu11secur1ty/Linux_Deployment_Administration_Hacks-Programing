#!/usr/bin/bash
echo "Give the IP that you want to block"
read target
read target
ufw deny from $target to any
ufw reload
ufw status numbered
