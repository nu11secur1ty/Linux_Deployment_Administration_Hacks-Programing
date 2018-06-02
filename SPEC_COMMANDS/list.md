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
```
- iptraf
```bash
zypper -n in iptraf
iptraf
```
# Will update soon... ;)





