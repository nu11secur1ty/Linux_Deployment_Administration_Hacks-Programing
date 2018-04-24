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
