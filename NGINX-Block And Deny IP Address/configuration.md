# Configure Nginx To Block IPs
- Edit nginx.conf file, enter (note my nginx path is set to /usr/local/nginx/, replace this according to your setup):

```bash
cd /usr/local/nginx/conf/
vim nginx.conf
```
- Add the following line in http section:

```bash
# Block spammers and other unwanted visitors 
  include blockips.conf;
```
- Save and close the file. Finally, create blockips.conf in /usr/local/nginx/conf/, enter:
```bash
vim blockips.conf
```
- Append / add entries as follows:

```bash
deny 1.2.3.4;         # Your Ip
deny 91.212.45.0/24;  # Your range
deny 91.212.65.0/24;  # Your range
```
- Save and close the file. Test the config file, enter:

```bash
nginx -t
```
#  output must be
```bash
the configuration file /usr/local/nginx/conf/nginx.conf syntax is ok
configuration file /usr/local/nginx/conf/nginx.conf test is successful
```
- Reload the new config, enter:

```bash
nginx -s reload
```
-----------------------------------------------------------------------------------------------------


# Deny All and Allow Only Intranet/LAN IPs

- Edit config ```blockips.conf```file as follows:
```bash 
location / {
  # block one workstation
  deny    192.168.1.1;
  # allow anyone in 192.168.1.0/24
  allow   192.168.1.0/24;
  # drop rest of the world 
  deny    all;
}
```
***Granted access to network 192.168.1.0/24 with the exception of the address 192.168.1.1.***

---------------------------------------------------------------------------------------------------


# Customize HTTP 403 Forbidden Error Messages

- Create a file called error403.html in default document root, enter:

```bash
cd /usr/local/nginx/html
vim error403.html
```
- add in error403.html

```html
<html>
<head><title>Error 403 - IP Address Blocked</title></head>
<body>
Your IP Address is blocked. If you this an error, please contact webmaster with your IP at webmaster@example.com
</body>
</html>
```
- If SSI enabled, you can display the client IP easily from the html page itself:

```html
Your IP Address is <!--#echo var="REMOTE_ADDR" --> blocked.
```

- Save and close the file. Edit your nginx.conf file, enter:

```bash
vim nginx.conf
```
- add in nginx.conf

```bash
# redirect server error pages to the static page
  error_page   403  /error403.html;
  location = /error403.html {
         root   html;
 }
 ```
 - Save and close the file. Reload nginx, enter:
 
 ```bash 
 nginx -s reload
 ```
 # Have fun ;)
 
 















