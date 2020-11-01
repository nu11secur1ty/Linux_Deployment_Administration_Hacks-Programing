# find and kill proc

1. - Login
```bash
mysql -u root -p
```

2. show all processec
```bash
SHOW PROCESSLIST;
```

3. Kill the process
- - - for example:

![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks-Programing/blob/master/MySQL/find_kill_proc/screen/mysql-show-processlist.png)

```bash
KILL 14;
```
# Kill All MySQL Processes for a Specific User

MySQL does not have a unique command for killing all processes.

To kill all processes for a specific user, use CONCAT to create a file with the list of threads and statements. In our case, we entered root as the user. To specify another user, replace root with the desired username.

```mysql
SELECT CONCAT('KILL ',id,';') FROM information_schema.processlist WHERE user='root' INTO OUTFILE '/tmp/process_list.txt';
```
This query created a file called process_list.txt. You can edit the name to your liking. Open the file and review if those are the processes you want to kill. When you are ready, enter:

```mysql
SOURCE /tmp/process_list.txt;
```

You can add conditions to the query to narrow down the list of processes in the output file. For example, add time > 1000 to the command to include only the processes with the time value higher than 1000.

```mysql
SELECT CONCAT('KILL ',id,';') FROM information_schema.processlist WHERE user='root' and time>1000 INTO OUTFILE '/tmp/process_list.txt';
```
- BR
