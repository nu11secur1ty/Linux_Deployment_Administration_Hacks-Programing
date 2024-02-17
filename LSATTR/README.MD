### lsattr

## Attributes in Linux
Some filesystems support additional attributes (other than those described in the preceding sections). In particular, some Linux-native filesystems support several attributes that you can adjust with the chattr command. The files and directories can have the following attributes:


```
a - append only
c - compressed
d - no dump
e - extent format
i - immutable
j - data journaling
s - secure deletion
t - no tail-merging
u - undeletable
A - no atime updates
D - synchronous directory updates
S - synchronous updates
T - top of directory hierarchy
```
### Define each file attributes
The detailed meaning of these attributes according to the manual page is:

a - append only: this attribute allows a file to be added to, but not to be removed. It prevents accidental or malicious changes to files that record data, such as log files.
c - compressed: it causes the kernel to compress data written to the file automatically and uncompress it when it’s read back.
d - no dump: it makes sure the file is not backed up in backups where the dump utility is used
e - extent format: it indicates that the file is using extents for mapping the blocks on disk.
i - immutable: it makes a file immutable, which goes a step beyond simply disabling write access to the file. The file can’t be deleted, links to it can’t be created, and the file can’t be renamed.
j - data journaling: it ensures that on an Ext3 file system the file is first written to the journal and only after that to the data blocks on the hard disk.
s - secure deletion: it makes sure that recovery of a file is not possible after it has been deleted.
t - no tail-merging: Tail-merging is a process in which small data pieces at a file’s end that don’t fill a complete block are merged with similar pieces of data from other files.
u - undeletable: When a file is deleted, its contents are saved which allows a utility to be developed that works with that information to salvage deleted files.
A - no atime updates: Linux won’t update the access time stamp when you access a file.
D - synchronous directory updates: it makes sure that changes to files are written to disk immediately, and not to cache first.
S - synchronous updates: the changes on a file are written synchronously on the disk.
T - and top of directory hierarchy: A directory will be deemed to be the top of directory hierarchies for the purposes of the Orlov block allocator.
How to list file attribute using lsattr command
Some Linux-native filesystems support several attributes that you can list with the lsattr command. To list attribute of files and sub-directory of the current directory, do
```
$ lsattr
 -----a-----------e- ./file1
 ----i------------e- ./hello_dir
 -----------------e- ./usrcopy
 -----------------e- ./special_characters
 -----------------e- ./file3
 -----------------e- ./contents
 -----------------e- ./hard_link
 -----------------e- ./usrlisting
```
Here we can see that the directory 'hello_dir' is immutable, and the file named 'file1' is append only file.

You can list the attribute of the contents of a particular directory with lsattr command followed with a file or directory name as the argument.
