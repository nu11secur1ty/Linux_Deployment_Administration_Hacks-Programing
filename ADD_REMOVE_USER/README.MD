# Add user on System D with `home` directory
```bash
useradd -m kur
```
# Manipulation for removing the user `kur`
```bash
# Lock User Accounts in Linux
passwd --lock kur

# Find and Kill All Running Processes of User
killall -9 -u kur

# Backup User Data Before Deleting
tar jcvf /user-backups/kur-home-directory-backup.tar.bz2 /home/kur

# Delete/Remove User Account and Files
userdel -r kur 
deluser --remove-home kur
userdel --remove kur
```

# Adding a User `kur` to a Group
-  Create group
```bash 
groupadd testgroup1

# Add user to this group
usermod -a -G root kur
usermod -a -G developers testuser
```
- Oner
```bash
groups kur 
kur : kur users
```
- Remove user from group
```bash
usermod -G root kur
usermod -G root,users kur
```

# BR
