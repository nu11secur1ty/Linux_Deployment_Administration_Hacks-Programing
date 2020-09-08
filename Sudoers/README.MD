# Remove `sudo` privileges
# WARNING: THIS IS VERY IMPORTANT FOR ANY SERVERS!

```bash
sed -i 's/root/#root/' /etc/sudoers && sed -i 's/%sudo/#%sudo/' /etc/sudoers
```
- Test it
```bash
domains@Ventsislav:~$ sudo su -
```
- The output should be:

```bash
domains is not in the sudoers file.  This incident will be reported.
```
- BR

@nu11secur1ty
