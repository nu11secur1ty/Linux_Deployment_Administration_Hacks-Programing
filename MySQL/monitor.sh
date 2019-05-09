#!/usr/bin/bash
# Author V.Varbanovski @nu11secur1ty

# Input your user
user=""
# Input your password
password=""

# Checking a global status
echo "===STATUS===";
	mysql -u $user -p$password -e "SHOW GLOBAL STATUS;"
	echo""
echo "===Processlist===";
	mysql -u $user -p$password -e "SHOW PROCESSLIST;"
	echo""
echo "===Queriesi===";
	mysql -u $user -p$password -e "SHOW FULL PROCESSLIST\G;"
	echo""
echo "===WARNINGS===";
	mysql -u $user -p$password -e "SHOW COUNT(*) WARNINGS;"
exit 0;
