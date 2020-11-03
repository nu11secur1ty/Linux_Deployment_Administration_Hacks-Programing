# Uderstanding CPU Load Average from V.Varbanovski @nu11secur1ty

Hello friends, this table will be helping you to calculate your CPU Loading Average depends on what you want to run on your Linux Server, and how many Cores you want to use!
This example is building on VM Machine with two CPU's. I use this machine only for starting to create this table, and helping you to understand what actually is `Load Average`

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Checking your load Average
```bash
cat /proc/loadavg 
```
- Output:
```bash
0.40 0.18 0.13 2/962 9068
```
- - - Meaning: 
      
      `capacity:` *5% = full 10% = full 15% = full*
                   |          |          |
                  0.40       0.18       0.13 2/962 9068
```bash
0.40 0.18 0.13 2/962 9068
 |     |    |____ Loading of the last fifteen minutes
 |     |
 |     |___________
Loading of         |
the last one min   |
                   |_ Loading of the last five minute
```
- - - Loading Illustration, by using cars on a highway:
      Imagine that every car is a `process`

![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks-Programing/blob/master/Load_Average/picture/understanding-load-averages.png)

- When the machine is not busy
```bash
0.00 0.00 0.00
```
# Understanding loading

- single CPU core loading average:
```bash
6.10 6.25 6.35
 |     |    |____ processes, for fifteen minutes
 |     |__ processes, for five minutes  
 |
processes in one minute
```
- This will be anormal

# Dual CPU cores loading average:
```bash
10.10 10.25 10.35
 |     |    |____ processes, for fifteen minutes
 |     |__ processes, for five minutes  
 |
processes in one minute
```
- This will be anormal

- `WARNING:` If this will changing when you trying to connect to this machine, it will not respond to you if 
             the values are: `15.10 15.25 15.35`
             
# Twelve CPU cores loading average:
```bash
15.10 15.25 15.35
 |     |    |____ processes, for fifteen minutes
 |     |__ processes, for five minutes  
 |
processes in one minute
```
- This will be anormal

- `WARNING:` If this will changing when you trying to connect to this machine, it will not respond to you if 
             the values are: `35.10 35.25 35.35`

# Twenty-four CPU cores loading average:
```bash
30.10 30.25 30.35
 |     |    |____ processes, for fifteen minutes
 |     |__ processes, for five minutes  
 |
processes in one minute
```
- This will be anormal
- `WARNING:` If this will changing when you trying to connect to this machine, it will not respond to you if 
             the values are: `131.10 131.25 131.35`

- bonus :D

[Reading more:](http://www.brendangregg.com/blog/2017-08-08/linux-load-averages.html)
# BR 
- @nu11secur1ty
