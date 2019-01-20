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
- Add this contend in to a file ***main.c*** ***This program is showing you your hostname and your IP.***
```C
// C program to display hostname 
// and IP address 
#include <stdio.h> 
#include <stdlib.h> 
#include <unistd.h> 
#include <errno.h> 
#include <netdb.h> 
#include <sys/types.h> 
#include <sys/socket.h> 
#include <netinet/in.h> 
#include <arpa/inet.h> 
  
// Returns hostname for the local computer 
void checkHostName(int hostname) 
{ 
    if (hostname == -1) 
    { 
        perror("gethostname"); 
        exit(1); 
    } 
} 
  
// Returns host information corresponding to host name 
void checkHostEntry(struct hostent * hostentry) 
{ 
    if (hostentry == NULL) 
    { 
        perror("gethostbyname"); 
        exit(1); 
    } 
} 
  
// Converts space-delimited IPv4 addresses 
// to dotted-decimal format 
void checkIPbuffer(char *IPbuffer) 
{ 
    if (NULL == IPbuffer) 
    { 
        perror("inet_ntoa"); 
        exit(1); 
    } 
} 
  
// Driver code 
int main() 
{ 
    char hostbuffer[256]; 
    char *IPbuffer; 
    struct hostent *host_entry; 
    int hostname; 
  
    // To retrieve hostname 
    hostname = gethostname(hostbuffer, sizeof(hostbuffer)); 
    checkHostName(hostname); 
  
    // To retrieve host information 
    host_entry = gethostbyname(hostbuffer); 
    checkHostEntry(host_entry); 
  
    // To convert an Internet network 
    // address into ASCII string 
    IPbuffer = inet_ntoa(*((struct in_addr*) 
                           host_entry->h_addr_list[0])); 
  
    printf("Your Hostname: %s\n", hostbuffer); 
    printf("Your Host IP: %s\n", IPbuffer); 
  
    return 0; 
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
# Create spec file using for building this ***app***
```bash
vim displayeuid.spec
```
- Add in to a spec file
```
#
# spec file for package displayeuid
#
# Copyright (c) 2019 SUSE LINUX GmbH, Nuernberg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via http://bugs.opensuse.org/
#


Name:           displayeuid
Version:        1.0 
Release:        1
Summary:        Display Effective UID
License:        GPLv2
Group:          Tools
Url:            http://nu11secur1ty.com
Source:         %{name}.tar.gz  
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
AutoReqProv:    on

%description
A simple demo program that has the SUID bit set and display the REAL user ID
and the EFFECTIVE UID 
Authors:
-------
     Ventsislav Varbanovski

%prep
%setup

%build
make

%install
make install

%files
%defattr(4755,root,rooti,0755)
/usr/bin/displayeuid
```
# Create tar.gz Archive
```bash
tar -czvf rpmbuild/SOURCES/displayeuid.tar.gz displayeuid-1.0/
```
# Building RPM
```bash
rpmbuild -ba displayeuid-1.0/displayeuid.spec
```
# Install the program from RPM
```
sudo rpm -Uvh /home/build/rpmbuild/RPMS/x86_64/displayeuid-1.0-1.x86_64.rpm
```
# Uninstall the program:
```
sudo zypper remove displayeuid
```


# Have fun with nu11secur1ty ;)















