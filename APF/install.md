    1  apt install squid
    2  apt install vim
   19  apt install mc
   92  apt install postfix
   94  apt install apache2
   99  apt install sensors
  100  apt install lm-sensors
  103  apt purge lm-sensors
  207  history | apt install
  208  history | grep apt install
  209  history | grep apt

---------------------------------------------

### SETUP ####
# Edit squid.conf

vim /etc/squid/squid.conf

- check acl's:

```
acl SSL_ports port 443
acl Safe_ports port 80          # http
acl Safe_ports port 21          # ftp
acl Safe_ports port 443         # https
acl Safe_ports port 70          # gopher
acl Safe_ports port 210         # wais
acl Safe_ports port 1025-65535  # unregistered ports
acl Safe_ports port 280         # http-mgmt
acl Safe_ports port 488         # gss-http
acl Safe_ports port 591         # filemaker
acl Safe_ports port 777         # multiling http
acl CONNECT method CONNECT
```

- restrict

```
# Deny requests to certain unsafe ports
http_access deny !Safe_ports

# Deny CONNECT to other than secure SSL ports
http_access deny CONNECT !SSL_ports

# Only allow cachemgr access from localhost
http_access allow localhost manager
http_access deny manager
```

- http access
```
#http_access allow localnet
http_access allow localhost

# And finally deny all other access to this proxy
#http_access deny all
http_access allow all
```

-SQIUD server Port
```
# Squid normally listens to port 3128
http_port 3128
```

### Firewall ###
https://www.rfxn.com/projects/advanced-policy-firewall/

1. mkdir apf
 cd apfinst
 wget https://www.rfxn.com/downloads/apf-current.tar.gz
 tar -xvf apf-current.tar.gz
 cd apf-1.7.6
 ./install.sh

2. Allow rules
vim /etc/apf/allow_hosts.rules
- - - Add

#YOUR OFFICE
0.0.0.0/24
0.0.0.0/24

#Your NETWORK
0.0.0.0/24


3. Configure POrts

# Common inbound (ingress) TCP ports
IG_TCP_CPORTS="53,80,443,943,1194,1195"

# Common inbound (ingress) UDP ports
IG_UDP_CPORTS="53,500,1194,1195,1701,4500"

# Common ICMP inbound (ingress) types
# 'internals/icmp.types' for type definition; 'all' is wildcard for any
IG_ICMP_TYPES="3,5,11,0,30,8"

4. Allow Spam house
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

- Test 
apf -r # test
if everything is please stop DEVEL_MODE

5. Stop dev mode
DEVEL_MODE="0"
---------------------------------------------------------------------------




