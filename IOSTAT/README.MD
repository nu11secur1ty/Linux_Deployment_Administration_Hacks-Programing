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
The `-m` parameter tells iostat to display metrics in megabytes per second instead of blocks or kilobytes per second. The 5 parameter causes iostat to recalculate its metrics every 5 seconds causing the numbers to be an average over this interval.

The tps number here is the number of I/O Operations Per Second (IOPS). Wikipedia has a nice list of average IOPS for different storage devices. This should give you a pretty good idea about the I/O load on your machine.

Some people put a lot of faith in the `%iowait` metric as an indicator for `I/O performance`. However, `%iowait` is first and foremost a CPU metric that measures the percentage of time the CPU is idle while waiting for an I/O operation to complete. This metric is heavily influenced by both your CPU speed and CPU load and is therefore easily misinterpreted.

For example, consider a system with just two processes: the first creating an `I/O bottleneck`, the second creating a CPU bottleneck. As the second process prevents the CPU from going idle, the `%iowait` metric will stay low despite the `I/O bottleneck` introduced by the first process. Similar examples can be found here (mirror). In short, both low and high `%iowait` values can be deceptive. The only thing `%iowait` tells us for sure is that the CPU is occasionally idle and can thus handle more computational work.

That just about covers the basic metrics. Let's move on to the extended metrics now by calling the iostat command with the `-x`
parameter.

```bash
$ iostat -mx 5

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           8.84    0.16    3.91    7.73    0.04   79.33

Device:         r/s     w/s   avgrq-sz avgqu-sz   await   svctm  %util
xvdap1        20.85   25.49   59.86     0.27      17.06    1.15   5.33
xvdb           0.10    0.29   51.06     0.00       7.17    0.09   0.00
xvdg          42.04   23.94   71.89     0.44       6.63    1.16   7.67
xvdf         132.66   72.52   42.87     0.49       2.37    0.36   7.42
xvdh          15.54   35.63   83.04     0.00      10.22    1.30   6.68
```

------------------------------------------------------------------------------------------------------------------------------

The r/s and w/s numbers show the number of read and write requests issued to the device per second. These numbers provide a more detailed breakdown of the tps number we saw earlier, as tps = r/s + w/s.

The avgqu-sz metric is an important value. Its name is rather poorly chosen as it does not in fact show the number of operations queued but not yet serviced. Instead, it shows the number of operations that were either queued or being serviced. Ideally you want to have an idea of the value of this metric during normal operations for use as a reference when trouble occurs. Single digit numbers with the occasional double digit spike are safe(ish) values. Triple digit numbers are generally not.

Note that this metric is unlikely to hover around zero unless you are doing very little I/O. A certain amount of queueing is generally unavoidable as modern storage devices reorder disk operations so as to improve overall performance.

The await metric is the average time from when a request is put in the queue to when the request is completed. Therefore, this metric is the sum of the time a request spent waiting in the queue and the time your storage device was working on servicing the request. This number is highly dependent on the number of items in the queue. Much like avgqu-sz, you'll want to have an idea of the value of this metric during normal operations for use as a reference when trouble occurs.

Our next metric is svctm. You'll find a lot of older blog posts that go into quite some detail about this one. However, man iostat makes it quite clear that this metric has now been deprecated and should no longer be trusted.

Our last metric is %util. Just like svctm, this metric has been touched by the progress of technology as well. The man pages show the following info.

%util

Percentage of elapsed time during which I/O requests were issued to the device (bandwidth utilization for the device). Device saturation occurs when this value is close to 100% for devices serving requests serially. But for devices serving requests in parallel, such as RAID arrays and modern SSDs, this number does not reflect their performance limits.

It’s common to assume that the closer to 100% utilization a device is, the more saturated it is. This is true when the storage device corresponds to a single magnetic disk as such a device can only serve one request at a time. However, a single SSD or a RAID array consisting of multiple disks can serve multiple requests at the same time. For such devices %util essentially indicates the percentage of time that the device was busy serving at least one request. Unfortunately, this tells us nothing about the maximum number of requests such a device can handle, and as such this value is useless as a saturation indicator for SSDs and RAID arrays.

By now it should hopefully be clear that iostat is an incredibly powerful tool that can take some experience to use correctly. In a perfect world, your machines should regularly be writing these metrics to a monitoring service so you always have access to good baseline numbers. In a non-perfect world, knowing your device's average IOPS numbers can already help you out quite a bit when trying to figure out if a slowdown is I/O related.

Note from Coderwall team: we've made up our own list of APM application performance monitoring tools.

[More:](https://www.xaprb.com/blog/2010/01/09/how-linux-iostat-computes-its-results/)
