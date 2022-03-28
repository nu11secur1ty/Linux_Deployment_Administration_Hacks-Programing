#!/usr/bin/bash
# by nu11secur1ty
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

service=squid

if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
then
	echo "$service is running!!!"
else
	systemctl start squid.service
fi
exit 0;
