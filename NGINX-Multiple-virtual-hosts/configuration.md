# Multiple virtual hosts in localhost
![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/NGINX-Multiple-virtual-hosts/Nginx_logo.svg.png)

--------------------------------------------------------------------------------------------------------

# Install NGINX on Linux OpenSUSE Leap 42.2, 42.3, 15

```bash
zypper -n in nginx
```
# Creating dir in htdocs:
```bash
cd /srv/www/htdocs/
mkdir site1 site2
```

# Create test web page for site1:
```bash
cd /srv/www/htdocs/site1/
echo "<h1>site1</h1>" >> index.html
```
# Create test web page for site2:
```bash
cd /srv/www/htdocs/site2/
echo "<h1>site2</h1>" >> index.html
```
------------------------------------------------------------------------------------------------------

# Creating of vhosts directory:
- For all sites in **sites** dir

```bash 
mkdir /etc/nginx/sites/
touch site1.conf site2.conf
```

# Configuration of sites.conf:
- add in site1.conf
```bash
server{
     listen 80;
     server_name nu11secur1ty.com www.nu11secur1ty.com;
      location /{
           root /var/www/htdocs/site1;
           index index.html;
     }
}
```
- add in site2.conf
```bash
server{
     listen 80;
     server_name nu11secur1ty1.com www.nu11secur1ty1.com;
      location /{ 
            root /var/www/htdocs/site2;
            index index.html;
     }
}
```
------------------------------------------------------------------------------------------------------

# Configure nginx.conf
- add ```include /etc/nginx/sites/*.conf;```in to a nginx.conf
```bash
http {
include mime.types;
include /etc/nginx/sites/*.conf;
default_type application/octet-stream;
```
# Check if configuration is ok:
```bash 
nginx -t
```
# Add to hosts file:
```bash 
127.0.0.1   www.nu11secur1ty.com
127.0.0.1   www.nu11secur1ty1.com
```
# Restart NGINX

------------------------------------------------------------------------------------------------------------

# NGINX PROXY REVERSE:


# On host nu11secur1ty1.com
- add: ```proxy_pass http://www.nu11secur1ty1.com;```
```bash
server{
      listen 80;
      server_name varbanovski1.com www.varbanovski1.com;
      location /{
      root /srv/www/htdocs/sites2/;
      index index.html;
       proxy_pass http://www.nu11secur1ty1.com;
     }
}
```
- To **redirect** on ```www.nu11secur1ty.com```

# On host nu11secur1ty.com
- add ```proxy_pass http://www.somewhere.com;```
```bash
server{
      listen 80;
      server_name nu11secur1ty.com www.nu11secur1ty.com;
      location / {
      root /srv/www/htdocs/sites1/;
      index index.html;
      proxy_pass http://www.somewhere.com;
     }
}
```
# Restart NGINX

```bash 
rcnginx restart
```

# Output:

- When you call ```www.nu11secur1ty1.com``` you will see result from ```www.nu11secur1ty.com```, which is redirected to  ```www.somewhere.com``` 
Don't worry if you don't understand anything, feel free to write me! ;)



# Have fun ;)

