#!/usr/bin/bash
# by nu11secur1ty 2022
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

squid=squid.service
openvpn=openvpn.service

# OpenVpn
if (( $(ps -ef | grep -v grep | grep $openvpn | wc -l) > 0 ))
then
	echo “$openvpn is running!!!”
else
	systemctl start openvpn.service
	#openvpn.service start
fi      
	systemctl status openvpn.service

	sleep 3;

# Squid
	if (( $(ps -ef | grep -v grep | grep $squid | wc -l) > 0 ))
then
        echo “$squid is running!!!”
else
        systemctl start squid.service
        #squid.service start
fi
        systemctl status squid.service

exit 0;
