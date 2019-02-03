![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/Importance_of_Linux_partitions/GrUbA.png)


# Disk partitioning is the creation of separate divisions of a hard disk drive using partition editors such as fdisk. Once a disk is divided into several partitions, directories and files of different categories may be stored in different partitions.

***Important***
![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/Importance_of_Linux_partitions/alert-attention-circle-exclamation-important-notification-warning-512.png)
- Many new Linux sys admin (or Windows admin) create only two partitions / (root) and swap for entire hard drive. This is really a bad idea. You need to consider the following points while partitioning disk.

# Purposes for Disk Partitioning


An operating system like Windows / Linux can be installed on a single, unpartitioned hard disk. However, the ability to divide a hard disk into multiple partitions offers some important advantages. If you are running Linux on server consider following facts:

   - Ease of use – Make it easier to recover a corrupted file system or operating system installation.
   - Performance – Smaller file systems are more efficient. You can tune file system as per application such as log or cache files. Dedicated swap partition can also improve the performance (this may not be true with latest Linux kernel 2.6).
   - Security – Separation of the operating system files from user files may result into a better and secure system. Restrict the growth of certain file systems is possible using various techniques.
   - Backup and Recovery – Easier backup and recovery.
   - Stability and efficiency – You can increase disk space efficiency by formatting disk with various block sizes. It depends upon usage. For example, if the data is lots of small files, it is better to use small block size.
   - Testing – Boot multiple operating systems such as Linux, Windows and FreeBSD from a single hard disk.

File systems that need their own partitions

# Partition	Purpose
------------------------------------------------------------------------------------------------------

/usr	  -    ***This is where most executable binaries, the kernel source tree and much documentation go.***
-----------------------------------------------------------------------------------------------------

/var	  -    ***This is where spool directories such as those for mail and printing go. 
                In addition, it contains the error log directory.***
------------------------------------------------------------------------------------------------------

/tmp	 -     ***This is where most temporary data files stored by apps.***
------------------------------------------------------------------------------------------------------

/boot	   -   ***This is where your kernel images and boot loader configuration go.***
------------------------------------------------------------------------------------------------------

/home	  -    ***This is where users home directories go.***
------------------------------------------------------------------------------------------------------

**If your system are is using from other users**

- Let us assume you have 120 GB SCSI hard disk with / (root) and swap partitions only. One of user (may be internal or external or cracker ) runs something which eats up all your hard disk space (DoS attack). For example, consider following tiny script that user can run in /tmp directory:


```bash
#!/bin/sh
man bash > $(mktemp)
$0
```
- Anyone can run above script via cron (if allowed), or even with nohup command:

```bash
$ nohup bad-script &
```
The result can be a total disaster as entire file system comes under Denial of Service attack. It will even bypass the disk quota restriction. One of our Jr. Linux sys admin created only two partition. Later poorly written application eats up all space in /var/log/. End result was memo for him (as he did not followed internal docs that has guidelines for partition setup for clients server). Bottom line create the partition on Linux server.

If you do not have a partition schema, than following attacks can take place:

    1. Runaway processes.
    2. Denial of Service attack against disk space (see above example script).
    3. Users can download or compile SUID programs in /tmp or even in /home.
    4. Performance tuning is not possible.
    5. Mounting /usr as read only not possible to improve security.
    6. All of this attack can be stopped by adding following option to /etc/fstab file:
    
- nosuid – Do not set SUID/SGID access on this partition
- nodev – Do not character or special devices on this partition
- noexec – Do not set execution of any binaries on this partition
- ro – Mount file system as readonly
- quota – Enable disk quota

---------------------------------------------------------------------------------------------------
# Please note that above options can be set only, if you have a separate partition. Make sure you create a partition as above with special option set on each partition:

```css
    /home – Set option nosuid, and nodev with diskquota option
    /usr – Set option nodev
    /tmp – Set option nodev, nosuid, noexec option must be enabled
```
# For example entry in /etc/fstabe for /home should read as follows:

```css
/dev/sda1  /home          ext3    defaults,nosuid,nodev 1 2
```

- Here is mount command output from one of my OpenBSD production server:

```css
/dev/wd0a on / type ffs (local)
/dev/wd1a on /home type ffs (local, nodev, nosuid, with quotas)
/dev/wd0d on /root type ffs (local)
/dev/wd0e on /usr type ffs (local, nodev)
/dev/wd0f on /tmp type ffs (local, nodev)
/dev/wd0h on /var type ffs (local, nodev, nosuid)
/dev/wd0g on /var/log type ffs (local, nodev)
```


# How do I obtain information about partitions?

- There are several ways that information about partitions can be obtained on Linux / UNIX like operating systems.

***List partitions:***
```
fdisk -l
```
***Report file system disk space usage:***
```
df -h
```
- OR
```
df -k
```
**Display partition mount options including mount points**

```bash
/dev/sda2 on / type ext3 (rw,relatime,errors=remount-ro)
tmpfs on /lib/init/rw type tmpfs (rw,nosuid,mode=0755)
/proc on /proc type proc (rw,noexec,nosuid,nodev)
sysfs on /sys type sysfs (rw,noexec,nosuid,nodev)
varrun on /var/run type tmpfs (rw,nosuid,mode=0755)
varlock on /var/lock type tmpfs (rw,noexec,nosuid,nodev,mode=1777)
udev on /dev type tmpfs (rw,mode=0755)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
devpts on /dev/pts type devpts (rw,noexec,nosuid,gid=5,mode=620)
fusectl on /sys/fs/fuse/connections type fusectl (rw)
/dev/sda1 on /media/sda1 type fuseblk (rw,nosuid,nodev,allow_other,default_permissions,blksize=4096)
/dev/sda5 on /share type fuseblk (rw,nosuid,nodev,allow_other,default_permissions,blksize=4096)
/dev/sdb2 on /disk1p2 type ext3 (rw,relatime,errors=remount-ro)
securityfs on /sys/kernel/security type securityfs (rw)
debugfs on /sys/kernel/debug type debugfs (rw)
binfmt_misc on /proc/sys/fs/binfmt_misc type binfmt_misc (rw,noexec,nosuid,nodev)
gvfs-fuse-daemon on /home/vivek/.gvfs type fuse.gvfs-fuse-daemon (rw,nosuid,nodev,user=vivek)
```

# Display / edit file system configuration options
```
less /etc/fstab
```
- or
```
vim /etc/fstab
```
- Quickly remount /usr in ro mode
```
mount -o remount, ro /usr
```
- Quickly mount all file system configured in /etc/fstab
```
mount -a
```


