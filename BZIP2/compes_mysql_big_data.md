# Compress folder - mysql big data

# Creating a large file on a Linux using fallocate command for the test!

- Create a folder, simulate database from `/var/lib/mysql/78`
```bash
mkdir -p 78
```
- Create 1G file

```bash
fallocate -l 1G test.img
```
- Checking the size
```bash 
du -sh test.img
```
- Let's compress
```bash
tar -cf 78.tar 78 && bzip2 78.tar
```
- Check the compressed size
```bash
du -sh 78.tar.bz2
```
- Decompressing and usage
```bash
bzip2 -d 78.tar.bz2 && tar -xvf 78.tar
```
# All is done congratulations ;)
