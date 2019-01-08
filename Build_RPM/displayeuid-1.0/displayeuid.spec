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
