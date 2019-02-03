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

/usr	   ***This is where most executable binaries, the kernel source tree and much documentation go.***
-----------------------------------------------------------------------------------------------------

/var	   ***This is where spool directories such as those for mail and printing go. In addition, it contains the error log directory.***
------------------------------------------------------------------------------------------------------

/tmp	   ***This is where most temporary data files stored by apps.***
------------------------------------------------------------------------------------------------------

/boot	   ***This is where your kernel images and boot loader configuration go.***
------------------------------------------------------------------------------------------------------

/home	   ***This is where users home directories go.***
------------------------------------------------------------------------------------------------------
