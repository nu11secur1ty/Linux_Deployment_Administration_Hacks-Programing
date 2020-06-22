# Find and delete files older than 5 days
```bash
root@nu11secur1ty:~# find /root/check/* -mtime +5 -exec rm -rf {} \;
```
# Find and delete files older than 5 minutes
```bas
root@nu11secur1ty:~# find /root/check/* -mmin +5 -exec rm -rf {} \;
```
