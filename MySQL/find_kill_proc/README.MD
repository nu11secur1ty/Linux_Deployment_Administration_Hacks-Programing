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
