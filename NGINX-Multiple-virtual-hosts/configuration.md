# Install NGINX on Linux OpenSUSE Leep 42.2, 42.3, 15

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



