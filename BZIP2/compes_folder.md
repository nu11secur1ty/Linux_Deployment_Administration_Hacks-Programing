# Create folder
```bash
mkdir -p ff && cd ff
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
cd ../
tar -czvf "$(date '+%Y-%m-%d_')ff.tar.gz" ff && bzip2 -z "$(date '+%Y-%m-%d_')"ff.tar.gz
```
- Check size
```bash
du -sh *2020*
```
# Have fun, now you are a hacker hackers :)P
