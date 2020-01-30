# Create folder
```bash
mkdir -p ff
```
- Create file in this folder
```bash
fallocate -l 1G image.png
```
- Check size
```bash
du -sh image.png
```
- Compress
```bash
tar -czvf "$(date '+%Y-%m-%d_')ff.tar.gz" ff && bzip2 -z "$(date '+%Y-%m-%d_')"ff.tar.gz
```
- Check size
```bash
du -sh ff.tar.gz.bz2
```
# Have fun hackers :)P
