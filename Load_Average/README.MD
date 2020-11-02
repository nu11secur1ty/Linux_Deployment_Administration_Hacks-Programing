# Uderstanding
```bash
cat /proc/loadavg 
```
- Output:
```bash
0.40 0.18 0.13 2/962 9068
```
- - - Meaning:
```bash
0.40 0.18 0.13 2/962 9068
 |     |    |____ Loading of the last fifteen minutes
 |     |
 |     |___________
Loading of         |
the last one min   |
                   |_ Loading of the last five minute
```

- When the machine is not busy
```bash
0.00 0.00 0.00
```
# Understanding loading

- single CPU core max loading average:
```bash
6.10 6.25 6.35
 |     |    |____ processes in fifteen minutes
 |     |__ processec in five minutes  
 |
processes in one minute
```
