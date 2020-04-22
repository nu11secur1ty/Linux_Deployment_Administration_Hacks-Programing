
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
        # Dirrect web htacces from vhost configuration
        # Usin correct tag <location>
<Location />
        AuthUserFile /home/your/path/secret/.secretfile
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
```conf
#### HTTP
# your_host
<VirtualHost 0.0.0.0:80>
	DocumentRoot "/home/your/path"
	ServerName example.com
	ServerAlias www. example.com
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
	AuthUserFile /home/your/path/.secretfile
	AuthName "Password Protected Area"
	AuthType Basic
	require valid-user
</Location>
</VirtualHost>
```
