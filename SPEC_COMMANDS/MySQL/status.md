# Mysql status

MariaDB [(none)]> status

```bash
--------------
mysql  Ver 15.1 Distrib 10.0.35-MariaDB, for Linux (x86_64) using readline 5.1

Connection id:		12
Current database:	
Current user:		root@localhost
SSL:			Not in use
Current pager:		less
Using outfile:		''
Using delimiter:	;
Server:			MariaDB
Server version:		10.0.35-MariaDB SLE 12 SP1 package
Protocol version:	10
Connection:		Localhost via UNIX socket
Server characterset:	utf8
Db     characterset:	utf8
Client characterset:	utf8
Conn.  characterset:	utf8
UNIX socket:		/var/run/mysql/mysql.sock
Uptime:			49 min 51 sec

Threads: 1  Questions: 29  Slow queries: 0  Opens: 1  Flush tables: 1  Open tables: 64  Queries per second avg: 0.009
--------------
```
# Process

```bash
MariaDB [(none)]> SHOW FULL PROCESSLIST\G
*************************** 1. row ***************************
      Id: 12
    User: root
    Host: localhost
      db: NULL
 Command: Query
    Time: 0
   State: init
    Info: SHOW FULL PROCESSLIST
Progress: 0.000
1 row in set (0.00 sec)
```
MariaDB [(none)]>
