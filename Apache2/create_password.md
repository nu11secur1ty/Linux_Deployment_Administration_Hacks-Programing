# Create password for access:
```bash     
htpasswd2 -c .htpasswd _username_
```
# Create Access for user on OpenSuse Leap 15
```bash
htpasswd2 -c /srv/www/htdocs/ .htpasswd _username_
```
# Add password for new user access:
```bash
useradd _username_
htpasswd2 /etc/apache2/.htpasswd _username_
```
