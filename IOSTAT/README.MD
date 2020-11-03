The iostat command can display both basic and extended metrics. We'll have a quick look at the basic metrics before moving on to the extended metrics in the rest of this post.

```bash
$ iostat -m 5

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           8.84    0.16    3.91    7.73    0.04   79.33

Device:            tps    MB_read/s    MB_wrtn/s    MB_read    MB_wrtn
xvdap1           46.34         0.33         1.03    2697023    8471177
xvdb              0.39         0.00         0.01       9496      71349
xvdg             65.98         1.34         0.97   11088426    8010609
xvdf            205.17         1.62         2.68   13341297   22076001
xvdh             51.16         0.64         1.43    5301463   11806257
```
