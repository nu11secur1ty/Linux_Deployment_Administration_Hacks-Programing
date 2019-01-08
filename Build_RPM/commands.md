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
     Andrew Mallett
editor:
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
















