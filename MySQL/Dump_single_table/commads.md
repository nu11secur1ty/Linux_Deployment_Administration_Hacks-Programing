Dump and restore a single table from a compressed (.sql.gz) format
Credit: John McGrath

Dump

mysqldump db_name table_name | gzip > table_name.sql.gz
Restore

gunzip < table_name.sql.gz | mysql -u username -p db_name
