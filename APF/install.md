### APF Firewall UBUNTU ###

[home](https://www.rfxn.com/projects/advanced-policy-firewall/)

- - - Install
```bash
 mkdir apfinst && cd apfinst
 wget https://www.rfxn.com/downloads/apf-current.tar.gz
 tar -xvf apf-current.tar.gz
 cd apf-1.7.6
 ./install.sh
```
2. Allow rules
```bash
vim /etc/apf/allow_hosts.rules
```
- - - Add
```
#YOUR OFFICE
0.0.0.0/24
0.0.0.0/24

#Your NETWORK
0.0.0.0/24
```

3. Configure POrts
- - - Open config in:
```bash
vim /etc/apf/conf.apf
```

# Common inbound (ingress) TCP ports
```bash
IG_TCP_CPORTS="22,53,80,443,943,1194,1195"
```
# Common inbound (ingress) UDP ports
```bash
IG_UDP_CPORTS="22,53,500,1194,1195,1701,4500"
```
# Common ICMP inbound (ingress) types
```bash
# 'internals/icmp.types' for type definition; 'all' is wildcard for any
IG_ICMP_TYPES="3,5,11,0,30,8"
```
4. Allow Spam house
```bash
DLIST_SPAMHAUS="1"
DLIST_SPAMHAUS_URL="http://www.spamhaus.org/drop/drop.lasso"


DLIST_PHP="1"
DLIST_PHP_URL="http://cdn.rfxn.com/downloads/php_list"

DLIST_ECNSHAME="1"
DLIST_ECNSHAME_URL="http://cdn.rfxn.com/downloads/ecnshame.lst"

DLIST_RESERVED="1"
DLIST_RESERVED_URL="http://cdn.rfxn.com/downloads/reserved.networks"

DLIST_DSHIELD="1"
DLIST_DSHIELD_URL="http://feeds.dshield.org/top10-2.txt"

DLIST_SPAMHAUS="1"
DLIST_SPAMHAUS_URL="http://www.spamhaus.org/drop/drop.lasso"
```
- Test 
```bash
apf -r # test
```
if everything is OK stop the DEVEL_MODE

5. Stop dev mode from
```bash
DEVEL_MODE="1"
```
- - - to 

```bash
DEVEL_MODE="0"
```
