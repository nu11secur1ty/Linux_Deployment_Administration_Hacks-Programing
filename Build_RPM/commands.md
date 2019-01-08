# 
# Create RPM-BUILD-Directory and Resources
```bash
mkdir -p rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
```
# Check for Basic-Devel tools
```bash
zypper se -i -t pattern
```
# Create user
```bash
useradd -m build
passwd build
```
# Login with build user
```bash
su - build
```

# Build rpmmacros
```bash
vim .rpmmacros
```
- add in to a file:
```bash
%_topdir   /home/buld/rpmbuild
```
# Create application node
```bash
mkdir displayeuid-1.0
```
# Navigate to the node
```bash
cd displayeuid-1.0
```
# Create the program using C 
```bash
vim main.c
```
- Add this contend in to a file ***main.c***
```C
#include<stdio.h>
#include<stdio.h>


























mkdir displayeuid-1.0
ls
cd displayeuid-1.0/
ls
vim main.c
ls
vim Makefile
vim displayeuid.spec
ls
cd
tar -czvf rpmbuild/SOURCES/displayeuid.tar.gz displayeuid-1.0/
ls rpmbuild/SOURCES/
ls
rpmbuild -ba displayeuid-1.0/displayeuid.spec 
vim displayeuid-1.0/displayeuid.spec 
rpmbuild -ba displayeuid-1.0/displayeuid.spec 
vim displayeuid-1.0/displayeuid.spec 
ls
cd rpmbuild/SOURCES/
ls
rm displayeuid.tar.gz
cd
tar -czvf rpmbuild/SOURCES/displayeuid.tar.gz displayeuid-1.0/
rpmbuild -ba displayeuid-1.0/displayeuid.spec 
display
cd rpmbuild/SOURCES/
rm displayeuid.tar.gz
cd ..
ls
cd
ls
cd displayeuid-1.0/
ls
vim main.c 
cd
tar -czvf rpmbuild/SOURCES/displayeuid.tar.gz displayeuid-1.0/
su -
cd /home/build/rpmbuild/RPMS/x86_64
rpm -i displayeuid-1.0-1.x86_64.rpm 
sudo rpm -i displayeuid-1.0-1.x86_64.rpm 
cd
su - build 
displayeuid 
displayeuid -help
displayeuid --help
whereis displayeuid
