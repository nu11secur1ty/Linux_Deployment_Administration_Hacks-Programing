# Find and delete files older than 5 days
```bash
root@nu11secur1ty:~# find /root/check/* -mtime +5 -exec rm -rf {} \;
```
# Find and delete files older than 5 minutes
```bas
root@nu11secur1ty:~# find /root/check/* -mmin +5 -exec rm -rf {} \;
```
- - - Content

# Find and delete files in folder older than 5 days
```bash
root@nu11secur1ty:~# find /root/check/1/* -mtime +1 -exec rm -rf {} \;
```
# Find and delete files in folder older than 5 minutes
```bash
root@nu11secur1ty:~# find /root/check/1/* -mmin +1 -exec rm -rf {} \;
```
- - - If you want to view the output use option: `-rv` for example:

```nash
root@nu11secur1ty:~# find /root/check/1/* -mmin +1 -exec rm -rv {} \;
```
