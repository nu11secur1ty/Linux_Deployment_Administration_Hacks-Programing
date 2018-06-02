# Print all process tree and their children:
```bash
ps aufx | more
ps axlwwf 
```

# Print all showing started modules in Linux:
```bash
lsmod
```
# Which program(s) are generating the traffic
```bash
netstat -np | grep -v ^unix
```
# Read Storage space in your system:
```bash
df -h
```
# Read size of file and folder:
```bash
du -h /tmp/
```
# Grep proccess pid
```bash
pgrep -f _program_
```
# Installing net-tools for Open Suse Leap42.3
```bash
zypper -n in net-tools-deprecated
```
# Network Statistics
```bash
netstat -a
netstat -tulpn
```
- Iostat
```bash
zypper -n in sysstat
iostat


Usage: iostat [ options ] [ <interval> [ <count> ] ]
Options are:
[ -c ] [ -d ] [ -h ] [ -k | -m ] [ -N ] [ -s ] [ -t ] [ -V ] [ -x ] [ -y ] [ -z ]
[ -j { ID | LABEL | PATH | UUID | ... } ] [ --human ] [ -o JSON ]
[ [ -H ] -g <group_name> ] [ -p [ <device> [,...] | ALL ] ]
[ <device> [...] | ALL ]
```
- iptraf
```bash
zypper -n in iptraf
iptraf
```
- vmstat
```bash
vmstat 

Options:
 -a, --active           active/inactive memory
 -f, --forks            number of forks since boot
 -m, --slabs            slabinfo
 -n, --one-header       do not redisplay header
 -s, --stats            event counter statistics
 -d, --disk             disk statistics
 -D, --disk-sum         summarize disk statistics
 -p, --partition <dev>  partition specific statistics
 -S, --unit <char>      define display unit
 -w, --wide             wide output
 -C, --full-cache       add further cache lines to main cache
 -t, --timestamp        show timestamp

 -h, --help     display this help and exit
 -V, --version  output version information and exit
```


# Will update soon... ;)





