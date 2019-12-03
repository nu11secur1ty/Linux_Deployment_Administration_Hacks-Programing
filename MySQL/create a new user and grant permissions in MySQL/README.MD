# Create a new user

```bash	
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
```

# Grant permissions for a user

 - database – the name of the MySQL database to which we grant access
 - table – the name of the database table to which we grant access

```bash
GRANT ALL PRIVILEGES ON database.table TO 'user'@'localhost';
```
# grant access to all databases/tables:

```bash
GRANT ALL PRIVILEGES ON database.* TO 'user'@'localhost';
```
- or

```bash
 	
GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost';
```
