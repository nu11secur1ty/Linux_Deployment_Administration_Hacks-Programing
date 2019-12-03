# Create a new user

```bash	
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
```

# Grant permissions for a user to a specific table from a database:

 - database – the name of the MySQL database to which we grant access
 - table – the name of the database table to which we grant access

```bash
GRANT ALL PRIVILEGES ON database.table TO 'user'@'localhost';
```
# grant access to all databases/tables:

```bash
GRANT ALL PRIVILEGES ON database.* TO 'user'@'localhost';
```
- For anly `SELECT`

```
GRANT SELECT ON database.table TO 'user'@'localhost';
```
- to all

```bash
 	
GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost';
```

# MySQL privileges which are most commonly used:


- ALL PRIVILEGES – grants all privileges to the MySQL user
- CREATE – allows the user to create databases and tables
- DROP - allows the user to drop databases and tables
- DELETE - allows the user to delete rows from specific MySQL table
- INSERT - allows the user to insert rows into specific MySQL table
- SELECT – allows the user to read the database
- UPDATE - allows the user to update table rows


# Only two privileges

```bash
GRANT SELECT, INSERT, DELETE ON database.* TO 'user'@'localhost';
```
- Apply

```bash
FLUSH PRIVILEGES;
```
# Remove an existing MySQL user
```
DROP USER 'user'@'localhost'
```


