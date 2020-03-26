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
