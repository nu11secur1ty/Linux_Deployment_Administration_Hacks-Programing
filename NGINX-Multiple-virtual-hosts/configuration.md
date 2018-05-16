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

