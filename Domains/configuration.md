# This page describes sub-domain configuration, where sub-domain addressing structures are defined as being:
```
    zone (domain) name = example.com
    domain host name = bill.example.com
    sub-domain name = us.example.com
    sub-domain host name = ftp.us.example.com
```
You have a choice of two strategies for handing such sub-domain addressing structures:

   1. Fully delegate the sub-domain - in this case you will need to add the subdomain's NS RRs and, depending on the method, corresponding A/AAAA (glue) RR(s) to the domain zone file, one or more name servers for the sub-domain and a subdomain zone file.
   2. Create a virtual (or pseudo) sub-domain - in this case you will define the sub-domain's configuration, as well as the main zone configuration, in the domain zone file.

This page describes configuring a virtual sub-domain which means the main domain and the subdomain definition are included in a single zone file - it requires no new name servers, no NS RRs and no A/AAAA (glue) RRs. The negative is that any change in either the zone or the subdomain will require a zone reload, whereas with fully delegated zones changes in either the zone or the subdomain will only require a reload of, respectively, the zone or the subdomain.

# Zone Name Server Configuration

-------------------------------------------------------------------------------------------------------------------------------

The primary name server for our domain is running BIND and has a named.conf file that defines the zone.

# Note:
We received some mail which suggested that we show the explicit use of the allow-transfer statement in these configurations. The samples in Chapter 6 all show this statement in use but for anyone just using this section we have included it for the sake of completeness.

# Zone Name-Server named.conf

The "named.conf" file will contain statements similar to the following fragment:

```
// named.conf file fragment
....
options {
    ....
    // stop zone transfer from all sources
    allow-transfer {"none";};
    ....
};
zone "example.com" in{
   type master;
   file "master/master.example.com";
   // explicitly allow zone transfer from the slave
   allow-transfer {192.168.0.4;};
};
```

# Zone Name-Server Zone Files

----------------------------------------------------------------------------------------------------------------------------



The file 'master.example.com' (or whatever naming convention you use) will contain our domain and sub-domain configuration with, say, a couple of name servers.

```
; zone fragment for 'zone name' example.com
; name servers in the same zone
$TTL 2d ; zone default TT = 2 days
$ORIGIN example.com.
@              IN      SOA   ns1.example.com. hostmaster.example.com. (
               2003080800 ; serial number
               2h         ; refresh =  2 hours 
               15M        ; update retry = 15 minutes
               3W12h      ; expiry = 3 weeks + 12 hours
               2h20M      ; minimum = 2 hours + 20 minutes
               )
; main domain name servers
              IN      NS     ns1.example.com.
              IN      NS     ns2.example.com.
; mail servers for main domain
              IN      MX 10  mail.example.com.
; A records for name servers above 
ns1           IN      A      192.168.0.3
ns2           IN      A      192.168.0.4
; A record for mail servers above 
mail          IN      A      192.168.0.5
; other domain level hosts and services
bill          IN      A      192.168.0.6
....
; sub-domain definitions
$ORIGIN us.example.com.
              IN      MX 10  mail
; record above uses blank substitution 
; and could have been written as 
; us.example.com.   IN  MX 10 mail.us.example.com.
; OR (using @ substitution)
; @ IN MX 10 mail
; A record for subdomain mail server
mail          IN      A      10.10.0.28
; the record above could have been written as 
; mail.us.example.com. A 10.10.0.28 if it's less confusing
ftp           IN      A      10.10.0.29 
; the record above could have been written as 
; ftp.us.example.com. A 10.10.0.29 if it's less confusing
....
; other subdomain definitions as required 
; WARNING: $ORIGIN us.example.com. affects all subsequent RRs until
; either another $ORIGIN or EOF
; adding $ORIGIN example.com. resets the $ORIGIN to the base domain name 
```


Additional sub-domains could be defined in the same file using the same strategy. For administrative convenience you could use $INCLUDE directives e.g. 


```
; snippet from file above showing use of $INCLUDE
....
; other domain level hosts and services
bill          IN      A      192.168.0.5
....
; sub-domain definitions
$INCLUDE us-subdomain.sub
; other subdomain definitions as required 
```
[Source](http://www.zytrax.com/books/dns/ch9/subdomain.html)

# Good luck.











