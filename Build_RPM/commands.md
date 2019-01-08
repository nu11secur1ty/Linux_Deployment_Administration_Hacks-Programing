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
#include<unistd.h>
int main() {
        int real = getuid();
        int euid = geteuid();
        printf("The REAL UID is: %d\n ",real);
        printf("The EFFECTIVE UID is: %d\n ",euid);
}
```
# Create Makefile
```bash
vim Makefile
```
- Add in to a Makefile
```C
all: suid
suid: main.c
        gcc -o displayeuid main.c
install: suid
        mkdir -p ${RPM_BUILD_ROOT}/usr/bin
        cp displayeuid ${RPM_BUILD_ROOT}/usr/bin
```














