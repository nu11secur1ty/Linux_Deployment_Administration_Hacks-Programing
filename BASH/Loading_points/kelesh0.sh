#!/usr/bin/bash
# by nu11secur1ty
# type your command
ping -c 4 abv.bg &

#sleep 7 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}" 
done
