# snaper - The interface ;) snapshot program.


# NOTE: This program is made by me for Linux OpenSUSE leap 42.3 and SLES_12 x, if you know how to change the program to work with your distro, please do this!!! If you don't know, ok I will describe here, how do you do this ;).

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
# v.0.1
use strict;
use warnings;
use diagnostics;
   our $color = `echo -e "\e[00;36mCreate a copy of your file system type your ssh host: example: 192.168.1.1
And, please confirm your pub_key, or your root password, three times if you dot want press 'Ctrl+z'\e[00m"\n`;
          print $color; 
  
        sleep 3;
my $ssh_host = <STDIN>;

    our $create_conteiner = `ssh '$ssh_host' mkdir /root/snaper/`;
our $create = `ssh '$ssh_host' mkdir /root/snaper/{bin,boot,usr,var,tmp,sys,srv,selinux,sbin,run,root,proc,opt,mnt,lib64,lib,home,etc,dev}`;
  

   print "Type your host or IP to send the backup there, example: 192.168.1.1\n";
my $host = <STDIN>;

### Part two
    my $color_warning = `echo -e "\e[00;31mNOTE: Read carefully if you don't want to make a snapshot of all filesystem!\e[00m"\n`;
       print $color_warning;
   
    my $color_t = `echo -e "\e[00;32mConfirm for bin, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_t;
our $bin = `rsync -a /bin/ '$host:'/root/snaper/bin/`;

    my $color_s = `echo -e "\e[00;32mConfirm for boot, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_s;
our $boot = `rsync -a /boot/ '$host:'/root/snaper/boot/`;

    my $color_r = `echo -e "\e[00;32mConfirm for dev, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_r;
our $dev = `rsync -a /dev/ '$host:'/root/snaper/dev/`;

    my $color_q = `echo -e "\e[00;32mConfirm for etc, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_q;
our $etc = `rsync -a /etc/ '$host:'/root/snaper/etc/`;

    my $color_p = `echo -e "\e[00;32mConfirm for home, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_p;
our $home = `rsync -a /home/ '$host:'/root/snaper/home/`;

    my $color_o = `echo -e "\e[00;32mConfirm for lib, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_o;
our $lib = `rsync -a /lib/ '$host:'/root/snaper/lib/`;

    my $color_n = `echo -e "\e[00;32mConfirm for lib64, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_n;
our $lib64 = `rsync -a /lib64/ '$host:'/root/snaper/lib64/`;

    my $color_m = `echo -e "\e[00;32mConfirm for mnt, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_m;
our $mnt = `rsync -a /mnt/ '$host:'/root/snaper/mnt/`;

    my $color_l = `echo -e "\e[00;32mConfirm for opt, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_l;
our $opt = `rsync -a /opt/ '$host:'/root/snaper/opt/`;

    my $color_k = `echo -e "\e[00;32mConfirm for proc, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_k;
our $proc = `rsync -a /proc/ '$host:'/root/snaper/proc/`;

    my $color_j = `echo -e "\e[00;32mConfirm for root, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_j;
our $root = `rsync -a /root/ '$host:'/root/snaper/root/`;

    my $color_i = `echo -e "\e[00;32mConfirm for run, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_i;
our $run = `rsync -a /run/ '$host:'/root/snaper/run/`;

    my $color_g = `echo -e "\e[00;32mConfirm for sbin, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_g;
our $sbin = `rsync -a /sbin/ '$host:'/root/sanper/sbin`; 

    my $color_f = `echo -e "\e[00;32mConfirm for selinux, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_f;
our $selinux = `rsync -a /selinux/ '$host:'/root/snaper/selinux/`;

    my $color_e = `echo -e "\e[00;32mConfirm for srv, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_e;
our $srv = `rsync -a /srv/ '$host:'/root/snaper/srv/`;

    my $color_d = `echo -e "\e[00;32mConfirm for sys, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_d;
our $sys = `rsync -a /sys/ '$host:'/root/snaper/sys/`;

    my $color_c = `echo -e "\e[00;32mConfirm for tmp, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_c;
our $tmp = `rsync -a /tmp/ '$host:'/root/snaper/tmp/`;

    my $color_b = `echo -e "\e[00;32mConfirm for usr, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_b;
our $usr = `rsync -a /usr/ '$host:'/root/snaper/usr/`;

    my $color_a = `echo -e "\e[00;32mConfirm for var, if you dot want press 'Ctrl+z'\e[00m"\n`;
       print $color_a;
our $var = `rsync -a /var/ '$host:'/root/snaper/`;
```
- 2
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
- 3
# So you have to set up the program to use your distro!

------------------------------------------------------------------------------------------------------------------------------

# Good luck, friends ;)
