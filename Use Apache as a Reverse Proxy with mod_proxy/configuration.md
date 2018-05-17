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
- For SuSE
```bash
rcapache2 restart
```

