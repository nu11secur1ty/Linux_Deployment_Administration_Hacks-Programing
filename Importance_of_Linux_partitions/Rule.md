# Disk partitioning is the creation of separate divisions of a hard disk drive using partition editors such as fdisk. Once a disk is divided into several partitions, directories and files of different categories may be stored in different partitions.

***Important***
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
