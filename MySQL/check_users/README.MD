# Check for avaliable users in mysql
```mysql
mysql>  SELECT User FROM mysql.user;
```
# check second method with more info
```mysql
mysql> select * from mysql.user;
mysql> select * from mysql.user \G;
```
# User and host
```mysql
mysql> SELECT User, Host FROM mysql.user;
```
