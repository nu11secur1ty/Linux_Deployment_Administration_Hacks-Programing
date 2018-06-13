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
# Network,storage & memory Statistics
- Netstat
```bash
netstat -a
netstat -tulpn

usage: netstat [-vWeenNcCF] [<Af>] -r         netstat {-V|--version|-h|--help}
       netstat [-vWnNcaeol] [<Socket> ...]
       netstat { [-vWeenNac] -i | [-cnNe] -M | -s [-6tuw] }

        -r, --route              display routing table
        -i, --interfaces         display interface table
        -g, --groups             display multicast group memberships
        -s, --statistics         display networking statistics (like SNMP)
        -M, --masquerade         display masqueraded connections

        -v, --verbose            be verbose
        -W, --wide               don't truncate IP addresses
        -n, --numeric            don't resolve names
        --numeric-hosts          don't resolve host names
        --numeric-ports          don't resolve port names
        --numeric-users          don't resolve user names
        -N, --symbolic           resolve hardware names
        -e, --extend             display other/more information
        -p, --programs           display PID/Program name for sockets
        -o, --timers             display timers
        -c, --continuous         continuous listing

        -l, --listening          display listening server sockets
        -a, --all                display all sockets (default: connected)
        -F, --fib                display Forwarding Information Base (default)
        -C, --cache              display routing cache instead of FIB

  <Socket>={-t|--tcp} {-u|--udp} {-U|--udplite} {-S|--sctp} {-w|--raw}
           {-x|--unix} --ax25 --ipx --netrom
  <AF>=Use '-6|-4' or '-A <af>' or '--<af>'; default: inet
  List of possible address families (which support routing):
    inet (DARPA Internet) inet6 (IPv6) ax25 (AMPR AX.25) 
    netrom (AMPR NET/ROM) ipx (Novell IPX) ddp (Appletalk DDP) 
    x25 (CCITT X.25)

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
---------------------------------------------------------------------------------------------------

# How Long A Process Has Been Running In Linux
```bash 
ps -p _your_pid -o etime
```
- Not only a single process, we can also display the uptime of all processes using command:
```bash
ps -eo pid,comm,lstart,etime,time,args
```



# Will update soon... ;)





