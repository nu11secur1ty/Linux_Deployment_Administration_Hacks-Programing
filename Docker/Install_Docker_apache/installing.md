# command
```bash
docker build -t webapp .
```
# The web app must be changed to your app from ```COPY /webapp/*``` /srv/www/htdocs/:

```bash
FROM opensuse:42.2
MAINTAINER devops@novacoast.com

RUN zypper --non-interactive --no-gpg-checks ref; \
    zypper --non-interactive in --recommends \
    apache2 php5 php5-mysql apache2-mod_php5 \
    php5-gd php5-gettext php5-mbstring php5-pear php5-curl php5-suhosin; \
    zypper clean; \
    sed -i 's/variables_order = "GPCS"/variables_order = "EGPCS"/g' /etc/php5/apache2/php.ini
    
COPY /webapp/* /srv/www/htdocs/

CMD rcapache2 start && tail -f /var/log/apache2/*log
```
