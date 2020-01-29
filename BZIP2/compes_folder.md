# Compress folder

# Creating a large file on a Linux using fallocate command

- Create folder
```bash
mkdir -p 78
```
- Create 1G file

```bash
fallocate -l 1G test.img
```
- Check size
```bash 
du -sh test.img
```
- Lets compress
```bash
tar -cf 78.tar 78 && bzip2 78.tar
```


