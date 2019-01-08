# 
# Create RPM-BUILD-Directory
```
mkdir -p rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
```
# Check for Basic-Devel tools
```
zypper se -i -t pattern
```
# Create user
```
useradd -m build
passwd build
```
# Login with build user
```
su - build
```













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
