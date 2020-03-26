This guide will show you how to check the current and past server load via SSH/Shell.

System Activity Reporter (SAR) is an important tool that shows system admins an overview of the server machine with status of various metrics at different points of time.

Using the sar command inside your Server from the command line will allow you to view history of server loads.

- - - Report queue length and load averages. The following values are displayed:

```bash
sar -q
```

- - - - Output

```xml
root@hostdime.com(~)$ sar -q
Linux 2.6.18-348.16.1.el5 (hostdime.com)   12/03/2013
12:00:01 AM   runq-sz  plist-sz   ldavg-1   ldavg-5  ldavg-15
12:10:01 AM              5         331         0.83      1.20      1.39
12:20:01 AM              7         316         1.20      0.78      1.01
12:30:01 AM              6         317         0.51      0.67      0.84
12:40:01 AM              5         312         0.75      0.62      0.73
12:50:01 AM              4         313         0.99      0.66      0.66
01:00:01 AM             8         328         0.48      0.45      0.54
01:10:04 AM             0         317          7.52      6.51      3.72
01:20:01 AM             5         318          2.44      4.54      4.29
01:30:01 AM             1         335          1.62      2.30      3.19
01:40:01 AM             5         333          2.25      2.33      2.77
01:50:01 AM             6         330          1.98      2.12      2.48
02:00:02 AM             2         355          2.57      3.31      3.01
02:10:03 AM             0         332          9.81      9.34      6.63
02:20:02 AM             0         316          3.67     11.16      9.75
02:30:01 AM             4         330         6.03      8.83      9.40
02:40:01 AM             6         320         0.70      2.43      5.84
02:50:01 AM             6         313         0.42      0.74      3.29
03:00:01 AM             6         324        0.32      0.47      1.93
03:10:01 AM             5         316         1.09      0.70      1.35
03:20:01 AM             6         322         1.01      1.08      1.25
03:30:01 AM             6         311         0.66      0.73      0.96
```
Here’s an explanation of the above variables:

“runq-sz” is the run queue length, which is the number of tasks waiting for run time.

“plist-sz” is the number of tasks in the task list.

“1davg-1” refers to the system load average over the last minute. The load average is calculated as the average number of runnable or running tasks (R state), and the number of tasks in uninterrupted sleep (D state) over the specified interval.

“ldavg-5” is the system load average for the past 5 minutes.

“ldavg-15” is, yup you guessed it, the system load average for the past 15 minutes.

Report memory utilization statistics. The following values are displayed:

```bash
sar -r
```
- - - - Results:
```bash
root@hostdime.com(~)$ sar -r Linux 2.6.18-348.16.1.el5 (hostdime.com)   12/03/2013

12:00:01 AM kbmemfree kbmemused  %memused kbbuffers  kbcached kbswpfree kbswpused  %swpused  kbswpcad
12:10:01 AM    328064   7845288     95.99    272396   4618712   2096312       160      0.01         0
12:20:01 AM    284252   7889100     96.52    276192   4639728   2096312       160      0.01         0
12:30:01 AM    261744   7911608     96.80    283888   4683176   2096312       160      0.01         0
12:40:01 AM    228208   7945144     97.21    284464   4654368   2096312       160      0.01         0
12:50:01 AM    310600   7862752     96.20    287632   4664608   2096312       160      0.01         0
01:00:01 AM    266508   7906844     96.74    290084   4687296   2096312       160      0.01         0
01:10:04 AM     65516   8107836     99.20     96704   5135720   2096312       160      0.01         0
01:20:01 AM     90536   8082816     98.89    217188   4779448   2096312       160      0.01         0
01:30:01 AM     67152   8106200     99.18    654052   3662544   2096312       160      0.01         0
01:40:01 AM    104840   8068512     98.72    834432   3053304   2096312       160      0.01         0
01:50:01 AM     51808   8121544     99.37    706384   3158536   2096312       160      0.01         0
02:00:02 AM     50392   8122960     99.38    240400   4271108   2096312       160      0.01         0
02:10:03 AM     61392   8111960     99.25     23328   5239120   2096312       160      0.01         0
02:20:02 AM     79088   8094264     99.03     95472   5256608   2096312       160      0.01         0
02:30:01 AM     85448   8087904     98.95    265840   4827460   2096312       160      0.01         0
02:40:01 AM    266552   7906800     96.74    613888   3851400   2096312       160      0.01         0
02:50:01 AM   1713428   6459924     79.04    622612   2439160   2096312       160      0.01         0
03:00:01 AM   1638272   6535080     79.96    630256   2484628   2096312       160      0.01         0
03:10:01 AM   1122544   7050808     86.27    643328   2967160   2096312       160      0.01         0
03:20:01 AM   1068264   7105088     86.93    653020   3021132   2096312       160      0.01         0
03:30:01 AM   1024828   7148524     87.46    661960   3042784   2096312       160      0.01         0
```


Here’s an explanation of the above variables:

“kbmemfree” is the amount of free memory available in kilobytes.

“kbmemused is the amount of used memory in kilobytes, which does not take into account memory used by the kernel itself.

“%memused” is the percentage of used memory.

“kbbuffers” is the amount of memory used as buffers by the kernel in kilobytes.

“kbcached” is the amount of memory used to cache data by the kernel in kilobytes.

“kbcommit” is the amount of memory needed for the current workload in kilobytes. This is an estimate for how much RAM/swap is needed to make sure there is enough memory.

“%commit” is the percentage of memory needed for current workload related to the total amount of RAM + swap (equals memory). This percantage may be greater than 100 percent because the kernel usually over-commits memory.

Report CPU utilization. The ALL keyword indicates that all the CPU fields should be displayed.


```bash
sar -u
```

- - - - - Result:


```xml
root@hostdime.com(~)$ sar -u Linux 2.6.18-348.16.1.el5 (hostdime.com)   12/03/2013

12:00:01 AM       CPU     %user     %nice   %system   %iowait    %steal     %idle
12:10:01 AM           all           0.53      1.82      1.84          7.05      0.00     88.77
12:20:01 AM           all          0.21      2.64      0.94          2.68      0.00     93.53
12:30:01 AM           all          0.23      1.89      1.10          3.73      0.00     93.04
12:40:01 AM           all          0.44      1.46      1.61          2.93      0.00     93.56
12:50:01 AM           all          0.21      1.31      0.84          2.49      0.00     95.14
01:00:01 AM          all          0.24      1.41      0.88          2.72      0.00     94.75
01:10:04 AM          all          0.45      3.71      2.52         21.41      0.00     71.91
01:20:01 AM          all          0.22      3.10      1.20         19.23      0.00     76.24
01:30:01 AM          all          0.22      2.57      1.62         12.26      0.00     83.33
01:40:01 AM          all          0.41      2.35      2.22         13.22      0.00     81.81
01:50:01 AM          all          0.20      2.08      1.37         12.88      0.00     83.46
02:00:02 AM         all          0.22      1.87      1.41         14.80      0.00     81.71
02:10:03 AM         all          0.46      1.43      2.84         22.09      0.00     73.18
02:20:02 AM         all          0.26      1.44      1.64         26.82      0.00     69.84
02:30:01 AM         all          0.47      2.13      1.28         23.52      0.00     72.62
02:40:01 AM         all          0.57      1.96      1.97         11.57      0.00     83.94
02:50:01 AM         all          0.21      1.47      0.82          2.74      0.00     94.76
03:00:01 AM         all          0.19      1.57      0.86          3.11      0.00     94.27
03:10:01 AM         all          0.44      1.63      1.65          4.53      0.00     91.76
03:20:01 AM         all          0.20      2.11      1.03          4.05      0.00     92.61
03:30:01 AM         all          0.19      1.56      0.85          2.56      0.00     94.84
```


