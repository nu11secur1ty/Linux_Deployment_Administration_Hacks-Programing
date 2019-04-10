# Showing running queries in MySQL

# Show all processlist
```mysql
show processlist;
show full processlist\G;
```
# Show all tasks

```mysql 
show variables\G;
```
# Show mem & cpu load average
```bash
ps -eo %mem,%cpu -S -p $(pgrep mysqld)
```
