# All bases:
```bash
mysqldump -u root -pPASSWORD --all-databases | bzip2 > /your/dir/databases_`data ' %m-%d-%Y'`.sql.bz2
```
# Single base:
```bash
mysqldump -u root -pPASSWORD tarator | bzip2 > /your/dir/tarator_`data ' %m-%d-%Y'`.sql.bz2
mysqldump -u root -p  tarator | bzip2 > /your/dir/tarator_data_$(date "+%Y-%m-%d").sql.bz2
```


