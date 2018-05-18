# Use Apache as a Reverse Proxy with mod_proxy 


# Enable these four necessary modules for apache2, execute the following commands in succession.
```bash
    sudo a2enmod proxy
    sudo a2enmod proxy_http
    sudo a2enmod proxy_balancer
    sudo a2enmod lbmethod_byrequests
```
# To put these changes into effect, restart Apache.
- For debian
```bash
systemctl restart apache2
```
- For ***SuSE***

```bash
a2enmod proxy
a2enmod proxy_http

rcapache2 restart
```
#  Enable Reverse Proxy
- Reverse Proxying a Single Backend Server
- Add on to ypur single ```vhost.conf```
```bash 
<VirtualHost *:80>
    ProxyPreserveHost On

    ProxyPass / http://127.0.0.1:8080/
    ProxyPassReverse / http://127.0.0.1:8080/
</VirtualHost>
```
# To put these changes into effect, restart Apache.
```bash
rcapache2 restart
systemctl restart apache2
```

# Load Balancing Across Multiple Backend Servers
- Add in to your ```vhosts.conf```
```bash
<VirtualHost *:80>
<Proxy balancer://mycluster>
    BalancerMember http://127.0.0.1:8080
    BalancerMember http://127.0.0.1:8081
</Proxy>

    ProxyPreserveHost On

    ProxyPass / balancer://mycluster/
    ProxyPassReverse / balancer://mycluster/
</VirtualHost>
```
# To put these changes into effect, restart Apache.

```bash
rcapache2 restart
systemctl restart apache2
```

# Have fun ;)

