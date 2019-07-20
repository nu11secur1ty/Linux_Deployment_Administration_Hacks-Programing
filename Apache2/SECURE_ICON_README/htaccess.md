# Securing Apache2 icons/README
- Going to 
```bash 
cd /usr/share/apache2/icons
```
- Create .htaccess file and add in to
```bash
# Protect README
<Files README.html>
  Order Allow,Deny
  Deny from all
</Files>
<Files README>
  Order Allow,Deny
  Deny from all
</Files>
```
