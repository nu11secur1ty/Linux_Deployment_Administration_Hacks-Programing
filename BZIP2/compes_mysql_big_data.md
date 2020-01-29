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
tar -czvf "$(date '+%Y-%m-%d_')78.tar.gz" 78 && bzip2 -z "$(date '+%Y-%m-%d_')"78.tar.gz
```
- Check the compressed size
```bash
du -sh 2020-01-29_78.tar.gz.bz2
```
- Decompressing and usage
```bash
bzip2 -d 2020-01-29_78.tar.gz.bz2 && tar -xvf 2020-01-29_78.tar.gz
```
# All is done congratulations ;)
