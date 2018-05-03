
![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/Wildcard%20SSL%20Certificates%20with%20Let-s%20Encrypt%20-%20multiple%20domain%20setup/maxresdefault.jpg)


# In order to install certbot:

```bash
$ wget https://dl.eff.org/certbot-auto
$ chmod a+x ./certbot-auto
$ sudo ./certbot-auto
```
# In my case, I own the domain tashaci.com:

```bash
./certbot-auto certonly --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns -d *.tashaci.com -d *.vutre.tashaci.com
```
# An important parameter to notice is --server https://acme-v02.api.letsencrypt.org/directory, which will instruct the certbot client to use v2 of the Let's Encrypt API (we need that for wildcard certs). Also notice the two wildcard domains.

The certbot client will walk you through the process of registering an account, and it will instruct you on what to do to complete the challenges. You should see something like:

```bash
-------------------------------------------------------------------------------
Please deploy a DNS TXT record under the name
_acme-challenge.vutre.tashaci.com with the following value:
 
5GFgEqWd7AQrvHteRtfT5V-XXXXXXXXXXXXXX
 
Before continuing, verify the record is deployed.
-------------------------------------------------------------------------------
Press Enter to Continue
```
# How you deploy this TXT record will depend on (where your domain is registered). Once you have completed the TXT record, you should verify that it is working using nslookup:
# EXAMPLE:

- Just head to your dns control panel and add these records, which should look like this.

![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/Wildcard%20SSL%20Certificates%20with%20Let-s%20Encrypt%20-%20multiple%20domain%20setup/shot/image.png)

# Check if everything is ok:
```bash
$ nslookup -type=TXT _acme-challenge.vutre.tashaci.com
 
Server:         192.XXX.XXX.XXX
Address:        192.XXX.XXX.XXX#XX
 
Non-authoritative answer:
_acme-challenge.vutre.tashaci.com       text = "5GFgEqWd7AQrvHteRtfT5V-XXXXXXXXXXXXXX"
```
# When you have verified that the TXT record is properly deployed, proceed to the next challenge. Eventually, the certificate will be issued and you should see something like:

```bash
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/tashaci.com/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/tashaci.com/privkey.pem
   Your cert will expire on 2018-06-12. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot-auto
   again. To non-interactively renew *all* of your certificates, run
   "certbot-auto renew"
 - If you like Certbot, please consider supporting our work by:
 
   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
 ```

# The last step of the process is to export the certificate as a *.pfx file - not necessary:

```bash
$ sudo openssl pkcs12 \
-inkey /etc/letsencrypt/live/tashaci.com/privkey.pem \
-in /etc/letsencrypt/live/tashaci.com/cert.pem \
-export -out ./cloudy-ase.pfx
```

--------------------------------------------------------------------------------------------------------------

# meta::cpan

![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/Wildcard%20SSL%20Certificates%20with%20Let-s%20Encrypt%20-%20multiple%20domain%20setup/shot/raulmatei_gmail_com-metacpan-111220.png)



# Have fun ;)

