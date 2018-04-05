This page describes sub-domain configuration, where sub-domain addressing structures are defined as being:
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
Zone Name Server Configuration
