#!/usr/bin/bash
# Author V.Varbanovski @nu11secur1ty

# Input your user
user=""
# Input your password
password=""

# Checking a global status
	mysql -u $user -p$password -e "SHOW GLOBAL STATUS;"
		echo "===Processlist===";
	mysql -u $user -p$password -e "SHOW PROCESSLIST;"
		echo "===Queriesi===";
	mysql -u $user -p$password -e "SHOW FULL PROCESSLIST\G;"
		echo "===WARNINGS===";
	mysql -u $user -p$password -e "SHOW COUNT(*) WARNINGS;"
exit 0;
