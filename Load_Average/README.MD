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
 |     |    |____ processes, for fifteen minutes
 |     |__ processes, for five minutes  
 |
processes in one minute
```

# Dual CPU core max loading average:
```bash
10.10 10.25 10.35
 |     |    |____ processes, for fifteen minutes
 |     |__ processes, for five minutes  
 |
processes in one minute
```
- `WARNING:` If this will happen when you trying to connect to this machine, it will not respond to you if 
             the values are: `15.10 15.25 15.35`
             
