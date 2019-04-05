# Processes which are using memory

```bash
ps -eo pmem,pcpu,rss,vsize,args | sort -k 1 -r | less
```
- With exit
```bash
ps -eo pmem,pcpu,rss,vsize,args | sort -k 1 -r
```
