# Find and delete files older than 5 days
```bash
root@nu11secur1ty:~# find /root/check/* -mtime +5 -exec rm -rf {} \;
```
# Find and delete files older than 5 minutes
```bas
root@nu11secur1ty:~# find /root/check/* -mmin +5 -exec rm -rf {} \;
```
- - - find /root/check/1* -mmin +1 -exec rm -rf {} \;
# Find abd delete content in file older than 5 days
```bash
root@nu11secur1ty:~# find /root/check/1* -mtime +5 -exec rm -rf {} \;
```
# Find abd delete content in file older than 5 minutes
```bash
root@nu11secur1ty:~# find /root/check/1* -mmin +5 -exec rm -rf {} \;
```
