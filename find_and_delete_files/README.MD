# Find and delete files older than 5 days
```bash
root@nu11secur1ty:~# find /root/check/* -mtime +5 -exec rm -rf {} \;
```
# Find and delete files older than 5 minutes
```bas
root@nu11secur1ty:~# find /root/check/* -mmin +5 -exec rm -rf {} \;
```
- - - Content

# Find and delete content in file older than 5 days
```bash
root@nu11secur1ty:~# find /root/check/1* -mtime +5 -exec rm -rf {} \;
```
# Find and delete content in file older than 5 minutes
```bash
root@nu11secur1ty:~# find /root/check/1* -mmin +5 -exec rm -rf {} \;
```
