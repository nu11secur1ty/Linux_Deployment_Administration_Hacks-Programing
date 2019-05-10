# Dump and restore a single table from a compressed (.sql.gz) format

- Dump
```bash
mysqldump db_name table_name | gzip > table_name.sql.gz
```
- Restore
```bash
gunzip < table_name.sql.gz | mysql -u username -p db_name
```
