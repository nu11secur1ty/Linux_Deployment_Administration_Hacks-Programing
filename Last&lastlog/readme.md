last and lastb use /var/log/wtmp and /var/log/btmp files to log information. You can use the following command to clear wtmp/btmp:


```bash
/dev/null > /var/log/wtmp
/dev/null > /var/log/btmp
```
