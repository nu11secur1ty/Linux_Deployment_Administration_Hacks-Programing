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
The -m parameter tells iostat to display metrics in megabytes per second instead of blocks or kilobytes per second. The 5 parameter causes iostat to recalculate its metrics every 5 seconds causing the numbers to be an average over this interval.

The tps number here is the number of I/O Operations Per Second (IOPS). Wikipedia has a nice list of average IOPS for different storage devices. This should give you a pretty good idea about the I/O load on your machine.

Some people put a lot of faith in the %iowait metric as an indicator for I/O performance. However, %iowait is first and foremost a CPU metric that measures the percentage of time the CPU is idle while waiting for an I/O operation to complete. This metric is heavily influenced by both your CPU speed and CPU load and is therefore easily misinterpreted.

For example, consider a system with just two processes: the first creating an I/O bottleneck, the second creating a CPU bottleneck. As the second process prevents the CPU from going idle, the %iowait metric will stay low despite the I/O bottleneck introduced by the first process. Similar examples can be found here (mirror). In short, both low and high %iowait values can be deceptive. The only thing %iowait tells us for sure is that the CPU is occasionally idle and can thus handle more computational work.

That just about covers the basic metrics. Let's move on to the extended metrics now by calling the iostat command with the -x parameter.
