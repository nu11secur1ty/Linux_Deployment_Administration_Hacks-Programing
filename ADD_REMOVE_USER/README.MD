# Add user on Stsem D
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
# BR
