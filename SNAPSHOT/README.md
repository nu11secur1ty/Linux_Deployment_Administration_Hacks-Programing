# snaper - The interface ;) snapshot program.


# NOTE: This program is made by me for Linux OpenSUSE leep 42.3 and SLES_12 x, if you know how to change the program to work with your distro, please do this!!! If you don't know, ok I will describe here, how do you do this ;).

# So 
- 1
# Open the program via tex editor, in my case I will use vim:

```perl
vim /path/snaper.pl
```
# Ok, you should see this

```perl
#!/usr/bin/perl
# By Ventsislav Varbanovski - nu11secur1ty
use strict;
use warnings;
use diagnostics;

   print "Create a copy of your file system type your ssh host: example: 192.168.1.1\n";
   print "And, please confirm your pub_key, or your root password, three times...\n";
        sleep 3;
my $ssh_host = <STDIN>;
    our $create_conteiner = `ssh '$ssh_host' mkdir /root/snaper/`;
our $create = `ssh '$ssh_host' mkdir /root/snaper/{bin,boot,usr,var,tmp,sys,srv,selinux,sbin,run,root,proc,opt,mnt,lib64,lib,home,etc,dev}`;
  print "Type your host or IP to send the backup there, example: 192.168.1.1\n";
my $host = <STDIN>;

### Second Part

our $bin = `rsync -a /bin/ '$host:'/root/snaper/bin/`;
our $boot = `rsync -a /boot/ '$host:'/root/snaper/boot/`;
our $dev = `rsync -a /dev/ '$host:'/root/snaper/dev/`;
our $etc = `rsync -a /etc/ '$host:'/root/snaper/etc/`;
 our $home = `rsync -a /home/ '$host:'/root/snaper/home/`;
our $lib = `rsync -a /lib/ '$host:'/root/snaper/lib/`;
our $lib64 = `rsync -a /lib64/ '$host:'/root/snaper/lib64/`;
our $mnt = `rsync -a /mnt/ '$host:'/root/snaper/mnt/`;
our $opt = `rsync -a /opt/ '$host:'/root/snaper/opt/`;
our $proc = `rsync -a /proc/ '$host:'/root/snaper/proc/`;
 our $root = `rsync -a /root/ '$host:'/root/snaper/root/`;
our $run = `rsync -a /run/ '$host:'/root/snaper/run/`;
our $sbin = `rsync -a /sbin/ '$host:'/root/sanper/sbin`; 
our $selinux = `rsync -a /selinux/ '$host:'/root/snaper/selinux/`;
our $srv = `rsync -a /srv/ '$host:'/root/snaper/srv/`;
our $sys = `rsync -a /sys/ '$host:'/root/snaper/sys/`;
our $tmp = `rsync -a /tmp/ '$host:'/root/snaper/tmp/`;
our $usr = `rsync -a /usr/ '$host:'/root/snaper/usr/`;
our $var = `rsync -a /var/ '$host:'/root/snaper/`;
```
# In the second part of the program, you have to change your distro "DIRS" if they are different from this what is in the program.
# Example for varible "$srv":
```
our $srv = `rsync -a /srv/ '$host:'/root/snaper/srv/`;
```
# In most of the Linux distros the "srv" dir is missing, because the Apache2 web server is using "var" dir
# for pattern directory, example: in Ubuntu or Debin is:
```bash
/var/www/htdocs/
/var/www/html/
```
# In SUSE is:
```bash 
/srv/www/htdocs
```
# So you have to set up the program to use your distro!
# Good luck, friends ;)
