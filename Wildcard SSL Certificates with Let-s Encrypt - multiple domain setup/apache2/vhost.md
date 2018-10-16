# vhost
-- in /etc/apache2/vhosts.d


```bash
######################################
# Tashaci
<VirtualHost 0.0.0.0:443>
    DocumentRoot "/home/tashaci/web/htdocs"
    ServerName tashaci.com
    ServerAlias www.tashaci.com
    ErrorLog "/home/tashaci/log/tashaci_error_log"
    CustomLog "/home/tashaci/log/tashaci_access_log" combined
<Directory "/home/tashaci/web/htdocs">
      #Options All MultiViews               -sec
      #Options All MultiViews               
      Options none
      AllowOverride ALL
      Options All ExecCGI
      Require all granted
</Directory>
      SSLEngine on
      Include /etc/letsencrypt/options-ssl-apache.conf
      SSLCertificateFile /etc/letsencrypt/live/tashaci.com/fullchain.pem
SSLCertificateKeyFile /etc/letsencrypt/live/tashaci.com/privkey.pem
Include /etc/letsencrypt/options-ssl-apache.conf
</VirtualHost>
```
