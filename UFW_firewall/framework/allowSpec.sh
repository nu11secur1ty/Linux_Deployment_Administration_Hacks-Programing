#!/usr/bin/bash
echo "Give the IP which you want to allow"
read target

ufw allow from $target to any
ufw reload
ufw status numbered
