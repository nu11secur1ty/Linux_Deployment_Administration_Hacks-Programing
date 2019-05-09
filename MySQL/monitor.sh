#!/usr/bin/bash
# Author V.Varbanovski @nu11secur1ty


# You must install truncate 
truncate -s 0 /path/to/your/log/sqlreport.log


echo "Mysql-proc-monitor by V.Varbanovski @nu11secur1ty";
echo ""

date +'FORMAT'
date +'%m/%d/%Y'
date +'%r'
time_zone=$(date +'%m/%d/%Y')
echo ""

# Input your user for mysql
user=""
# Input your password for mysql
password=""

# Checking a global status
echo "===STATUS===";
	mysql -u $user -p$password -e "SHOW GLOBAL STATUS;"
	echo ""
echo "===Processlist===";
	mysql -u $user -p$password -e "SHOW PROCESSLIST;"
	echo ""
echo "===Queriesi===";
	mysql -u $user -p$password -e "SHOW FULL PROCESSLIST\G;"
	echo ""
echo "===WARNINGS===";
	mysql -u $user -p$password -e "SHOW COUNT(*) WARNINGS;"
exit 0;
