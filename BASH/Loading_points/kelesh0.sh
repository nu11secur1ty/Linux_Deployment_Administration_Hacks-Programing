#!/usr/bin/bash
# nu11secur1ty
sleep 7 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
# Your task  
ping -c 4 example.com
