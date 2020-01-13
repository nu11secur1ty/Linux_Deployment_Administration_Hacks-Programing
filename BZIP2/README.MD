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
- - test
```bash 
bzip2 -z test.txt
```
- - Output
```bash
du -sh test.txt.bz2 
4,0K	test.txt.bz2
```
---------------------------------------------------------------------------
# Turnback
- Decompress
```bash
bzip2 -d test.txt.bz2
```
- - output
```bash
du -sh test.txt 
1,1G	test.txt
```
# Have fun ;)
