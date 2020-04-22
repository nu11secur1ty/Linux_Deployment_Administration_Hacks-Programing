
# HTTPS
```conf
# your_host
<VirtualHost 0.0.0.0:443>
    DocumentRoot "/home/your/path"
    ServerName example.com
    ServerAlias example.com
    ErrorLog "/home/your/path/log/error_log"
    CustomLog "/home/your/path/log/access_log" combined
<Directory "/home/your/path/">
      #Options All MultiViews               -sec
      #Options All MultiViews               
      Options none
      AllowOverride ALL
      Options All ExecCGI
      Require all granted
</Directory>
      # Direct web htaccess from vhost configuration 
      # Using correct tag <location />
      # manual: <location /path/path/app.py>
<Location />
# For advanced: <location /path/path/app.py>
        AuthUserFile /home/your/path/qko_secret/.secretfile
        AuthName "Password Protected Area"
        AuthType Basic
        require valid-user
</Location>
      SSLEngine on
      Include /etc/letsencrypt/options-ssl-apache.conf
      SSLCertificateFile /etc/letsencrypt/live/example.com/fullchain.pem
      SSLCertificateKeyFile /etc/letsencrypt/live/example.com/privkey.pem
      Include /etc/letsencrypt/options-ssl-apache.conf
</VirtualHost>
```
---------------------------------------------------

# HTTP
```conf
# your_host
<VirtualHost 0.0.0.0:80>
	DocumentRoot "/home/your/path"
	ServerName example.com
	ServerAlias www.example.com
	ErrorLog "/home/your/path/log/error_log"
	CustomLog "/home/your/path/log/access_log" combined
<Directory "/home/your/path/web/htdocs">
	#Options All MultiViews
	Options none
	AllowOverride ALL
	Options All ExecCGI
	Require all granted
</Directory>
<Location />
	AuthUserFile /home/your/path/qko_secret/.secretfile
	AuthName "Password Protected Area"
	AuthType Basic
	require valid-user
</Location>
</VirtualHost>
```
