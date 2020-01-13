# Compressing Files Using 'bzip2'
```bash
bzip2 filename
bzip2 -z filename
```
# decompress a .bz2 file
```bash
bzip2 -d filename.bz2
```
# test
- Create 1G file
```
fallocate -l 1G test.txt
```
