# Install and setup Dovecot
![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/Postfix%20and%20Dovecot%20in%20openSUSE/troubleshooting-problems-with-postfix-dovecot-and-mysql.jpg)

```bash
zypper install dovecot
```
# Edit Dovecot main configuration file to allow IMAP, POP3 and LMPT protocols. Edit file ***/etc/dovecot/dovecot.conf***

```xml
protocols = imap pop3 lmtp
```

# Edit Mailbox location for mail users. Edit file ***/etc/dovecot/conf.d/10-mail.conf***

```xml
mail_location = maildir:~/Maildir
```

# Edit authentication process. Edit file ***/etc/dovecot/conf.d/10-auth.conf***

```xml
disable_plaintext_auth = yes

auth_mechanisms = plain login
```

# Edit master process. Add an Postfix Unix Listener in service auth. Edit file ***/etc/dovecot/conf.d/10-master.conf***

```xml
service auth {
  ...
  unix_listener /var/spool/postfix/private/auth {
    mode = 0660
    user = postfix
    group = postfix
  }
  ...
}
```

--------------------------------------------------------------------------------------------------------------

# Besides setting the initial Postfix configuration, modify ***/etc/postfix/main.cf*** file to store mails with Maildir format.

```bash
vim /etc/postfix/main.cf
```
```xml
home_mailbox = Maildir/
inet_interfaces = localhost, 0.0.0.0
inet_protocols = all
mydestination = $myhostname, localhost.$mydomain, $mydomain
myhostname = mail.gashnik.com
```

# Restart Postfix service.

```bash
service postfix restart
rcpostfix restart
```

# Start Dovecot service.

```bash
service dovecot start
rcdovecot start
```


# Have fun ;)
