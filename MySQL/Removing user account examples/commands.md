***To view all users in the MySQL database server, you use the following SELECT statement:***

```mysql	
SELECT user, host FROM mysql.user;
```
- Here is the user account list in our database server:
```mysql	
+---------------+-------------------+
| user          | host              |
+---------------+-------------------+
| api@localhost | %                 |
| remote        | %                 |
| dbadmin       | localhost         |
| mysql.sys     | localhost         |
| mysqlxsys     | localhost         |
| root          | localhost         |
| dbadmin       | mysqltutorial.org |
+---------------+-------------------+
7 rows in set (0.00 sec)
```
- Suppose you want to remove user account dbadmin@mysqltutorial.org, you use the following statement:
```mysql
DROP USER dbadmin@mysqltutorial.org;
```
- Querying data from mysql.user table again, you will see that the dbadmin@mysqltutorial.org has been removed.
```mysql
SELECT user, host FROM mysql.user;
```
- The user account dbadmin@mysqltutorial.org has been removed as shown in the following result set:

```mysql
+---------------+-----------+
| user          | host      |
+---------------+-----------+
| api@localhost | %         |
| remote        | %         |
| dbadmin       | localhost |
| mysql.sys     | localhost |
| mysqlxsys     | localhost |
| root          | localhost |
+---------------+-----------+
6 rows in set (0.00 sec)
```

- To remove user 'api@localhost'@% and remote user accounts in a single DROP USER statement, you use the following statement:

```mysql
DROP USER 'api@localhost', remote;
```
- Let’s verify the removal operation.
```mysql
SELECT user, host FROM mysql.user;
```
- We have four accounts left, the two accounts have been removed.

```mysql
+-----------+-----------+
| user      | host      |
+-----------+-----------+
| dbadmin   | localhost |
| mysql.sys | localhost |
| mysqlxsys | localhost |
| root      | localhost |
+-----------+-----------+
4 rows in set (0.00 sec)
```
Suppose a user account is logged in and has active session running. If you drop the user account, it won’t stop the open sessions. The active session will continue until user exits. Typically, in this case, you should shutdown user’s session immediately right before executing the DROP USER statement.

First, you need to identify the process id of the user by using the SHOW PROCESSLIST statement.

```mysql
+----+---------+-----------------+------+---------+------+------------+---------------------+
| Id | User    | Host            | db   | Command | Time | State      | Info                |
+----+---------+-----------------+------+---------+------+------------+---------------------+
| 30 | root    | localhost:54503 | NULL | Query   |  -14 | starting   | show processlist    |
| 40 | dbadmin | localhost:55350 | NULL | Query   |   48 | User sleep | select sleep(10000) |
+----+---------+-----------------+------+---------+------+------------+---------------------+
2 rows in set (0.00 sec)
```

***As you see, the dbadin@localhost user account has the process id 40.***
- Second, you kill this process by using

```mysql
KILL 40;
```
The user account dbadmin@localhost received an error message:

```mysql
ERROR 2013 (HY000): Lost connection to MySQL server during query
```
- Third, you execute DROP USER statement to remove user account dbadmin@localhost:

```mysql
DROP USER dbadmin@localhost;
```

It’s important to note that if you don’t terminate the active sessions, the removed user, if connected to the database server, still can perform all operations until the session ends.

In this tutorial, you have learned how to use the MySQL DROP USER statement to remove one or more user accounts.

