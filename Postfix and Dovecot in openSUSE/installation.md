![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/Postfix%20and%20Dovecot%20in%20openSUSE/troubleshooting-problems-with-postfix-dovecot-and-mysql.jpg)

# Install and setup Dovecot
```bash
zypper install dovecot
```
# Edit Dovecot main configuration file to allow IMAP, POP3 and LMPT protocols. Edit file ***/etc/dovecot/dovecot.conf***

```css
protocols = imap pop3 lmtp
```

# Edit Mailbox location for mail users. Edit file ***/etc/dovecot/conf.d/10-mail.conf***

```css
mail_location = maildir:~/Maildir
```

# Edit authentication process. Edit file ***/etc/dovecot/conf.d/10-auth.conf***

```css
disable_plaintext_auth = yes

auth_mechanisms = plain login
```

# Edit master process. Add an Postfix Unix Listener in service auth. Edit file ***/etc/dovecot/conf.d/10-master.conf***

```css
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
```css
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
rcdovecot restart
```

# ATTENTION! ***Check if everything is ok!***

```bash
rcpostfix status
```
  - output for postfix
```css
* postfix.service - Postfix Mail Transport Agent
   Loaded: loaded (/usr/lib/systemd/system/postfix.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2018-06-14 17:27:39 EEST; 26min ago
```
```bash
rcdovecot status
```
 - output for dovecot
```css
* dovecot.service - Dovecot IMAP/POP3 email server
   Loaded: loaded (/usr/lib/systemd/system/dovecot.service; enabled; vendor preset: disabled)
   Active: active (running) since Thu 2018-06-14 17:27:31 EEST; 28min ago
```

# Test

```bash 
telnet localhost smtp
telnet localhost pop3
```
- Send an email directly from postfix using terminal

```bash
sendmail recipient@elsewhere.com
From: you@example.com
Subject: Test mail
This is a test email
.
```
 - to exit you must type
 ***quit*** 
 
# Output 
```bash
cd /your_home/Maildir/new
ls
```
- output
```css
1528985254.V802I844fa7M656132.user  1528986290.V802I844300M466544.user
```

- Enable services
```bash
~ # systemctl enable postfix
~ # systemctl enable dovecot
```

- Disable services
```bash
~ # rcpostfix stop
~ # rcdovecot stop
~ # systemctl enable postfix
~ # systemctl enable dovecot
```
- Simple PHP sender

```php
<?php
  ini_set( 'display_errors', 1 );
    error_reporting( E_ALL );
     $from = "someonelse@example.com";
     $to = "someonelse@example.com";
        $subject = "PHP Mail Test script";
        $message = "This is a test to check the PHP Mail functionality";
      $headers = "From:" . $from;
        mail($to,$subject,$message, $headers);
   echo "Test email sent\n";
?>
```
# Have fun ;)
