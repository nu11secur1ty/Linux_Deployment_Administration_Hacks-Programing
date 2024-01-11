What is APF (Advanced Policy Firewall)? APF Firewall
APF is a policy based iptables firewall system designed for ease of use and configuration. It employs a subset of features to satisfy the veteran Linux user and the novice alike. Packaged in tar.gz format and RPM formats, make APF ideal for deployment in many server environments based on Linux. APF is developed and maintained by R-fx Networks: http://www.rfxnetworks.com/apf.php

This guide will show you how to install and configure APF firewall, one of the better known Linux firewalls available.10

Requirements:
- Root SSH access to your server

Lets begin!
Login to your server through SSH and su to the root user.

1. cd /root/downloads or another temporary folder where you store your files.

2. wget http://www.rfxnetworks.com/downloads/apf-current.tar.gz

3. tar -xvzf apf-current.tar.gz

4. cd apf-0.9.5-1/ or whatever the latest version is.

5. Run the install file: ./install.sh
You will receive a message saying it has been installed

Installing APF 0.9.5-1: Completed.

Installation Details:
  Install path:         /etc/apf/
  Config path:          /etc/apf/conf.apf
  Executable path:      /usr/local/sbin/apf
  AntiDos install path: /etc/apf/ad/
  AntiDos config path:  /etc/apf/ad/conf.antidos
  DShield Client Parser:  /etc/apf/extras/dshield/

Other Details:
  Listening TCP ports: 1,21,22,25,53,80,110,111,143,443,465,993,995,2082,2083,2086,2087,2095,2096,3306
  Listening UDP ports: 53,55880
  Note: These ports are not auto-configured; they are simply presented for information purposes. You must manually configure all port options.

6. Lets configure the firewall: pico /etc/apf/conf.apf
We will go over the general configuration to get your firewall running. This isn't a complete detailed guide of every feature the firewall has. Look through the README and the configuration for an explanation of each feature.

We like to use DShield.org's ""block"" list of top networks that have exhibited
suspicious activity.
FIND: USE_DS=""0""
CHANGE TO: USE_DS=""1""

7. Configuring Firewall Ports:

Cpanel Servers
We like to use the following on our Cpanel Servers

Common ingress (inbound) ports
# Common ingress (inbound) TCP ports -3000_3500 = passive port range for Pure FTPD
IG_TCP_CPORTS=""21,22,25,53,80,110,143,443,2082,2083, 2086,2087, 2095, 2096,3000_3500""
#

# Common ingress (inbound) UDP ports
IG_UDP_CPORTS=""53""

Common egress (outbound) ports
# Egress filtering [0 = Disabled / 1 = Enabled]
EGF=""1""

# Common egress (outbound) TCP ports
EG_TCP_CPORTS=""21,25,80,443,43,2089""
#
# Common egress (outbound) UDP ports
EG_UDP_CPORTS=""20,21,53""


Ensim Servers
We have found the following can be used on Ensim Servers - although we have not tried these ourselves as I don't run Ensim boxes.

Common ingress (inbound) ports
# Common ingress (inbound) TCP ports
IG_TCP_CPORTS=""21,22,25,53,80,110,143,443,19638""
#
# Common ingress (inbound) UDP ports
IG_UDP_CPORTS=""53""

Common egress (outbound) ports
# Egress filtering [0 = Disabled / 1 = Enabled]
EGF=""1""

# Common egress (outbound) TCP ports
EG_TCP_CPORTS=""21,25,80,443,43""
#
# Common egress (outbound) UDP ports
EG_UDP_CPORTS=""20,21,53""

Save the changes: Ctrl+X then Y


8. Starting the firewall
/usr/local/sbin/apf -s

Other commands:
usage ./apf [OPTION]
-s|--start ......................... load firewall policies
-r|--restart ....................... flush & load firewall
-f|--flush|--stop .................. flush firewall
-l|--list .......................... list chain rules
-st|--status ....................... firewall status
-a HOST CMT|--allow HOST COMMENT ... add host (IP/FQDN) to allow_hosts.rules and
                                     immediately load new rule into firewall
-d HOST CMT|--deny HOST COMMENT .... add host (IP/FQDN) to deny_hosts.rules and
                                     immediately load new rule into firewall


9. After everything is fine, change the DEV option
Stop the firewall from automatically clearing itself every 5 minutes from cron.
We recommend changing this back to ""0"" after you've had a chance to ensure everything is working well and tested the server out.

pico /etc/apf/conf.apf

FIND: DEVM=""1""
CHANGE TO: DEVM=""0""

10. Configure AntiDOS for APF
Relatively new to APF is the new AntiDOS feature which can be found in: /etc/apf/ad
The log file will be located at /var/log/apfados_log so you might want to make note of it and watch it!

pico /etc/apf/ad/conf.antidos

There are various things you might want to fiddle with but I'll get the ones that will alert you by email.

# [E-Mail Alerts]
Under this heading we have the following:

# Organization name to display on outgoing alert emails
CONAME=""Your Company""
Enter your company information name or server name..

# Send out user defined attack alerts [0=off,1=on]
USR_ALERT=""0""
Change this to 1 to get email alerts

 # User for alerts to be mailed to
USR=""your@email.com""
Enter your email address to receive the alerts

Save your changes! Ctrl+X then press Y
Restart the firewall: /usr/local/sbin/apf -r

11. Checking the APF Log

Will show any changes to allow and deny hosts among other things.
tail -f /var/log/apf_log

Example output:
Aug 23 01:25:55 ocean apf(31448): (insert) deny all to/from your_ip
Aug 23 01:39:43 ocean apf(32172): (insert) allow all to/from your_ip


12. New - Make APF Start automatically at boot time
To autostart apf on reboot, run this:

chkconfig --level 2345 apf on

To remove it from autostart, run this:

chkconfig --del apf


13. Denying IPs with APF Firewall (Blocking) 
Now that you have your shiny new firewall you probably want to block a host right, of course you do! With this new version APF now supports comments as well. There are a few ways you can block an IP, I'll show you 2 of the easier methods.

A) /etc/apf/apf -d IPHERE COMMENTHERENOSPACES
> The -d flag means DENY the IP address
> IPHERE is the IP address you wish to block
> COMMENTSHERENOSPACES is obvious, add comments to why the IP is being blocked
These rules are loaded right away into the firewall, so they're instantly active.
Example:

./apf -d your_ip TESTING

pico /etc/apf/deny_hosts.rules

Shows the following:

# added your_ip on 08/23/05 01:25:55
# TESTING
your_ip
B) pico /etc/apf/deny_hosts.rules

You can then just add a new line and enter the IP you wish to block. Before this becomes active though you'll need to reload the APF ruleset.

/etc/apf/apf -r

14. Allowing IPs with APF Firewall (Unblocking)

I know I know, you added an IP now you need it removed right away! You need to manually remove IPs that are blocked from deny_hosts.rules.
A) 
pico /etc/apf/deny_hosts.rules

Find where the IP is listed and remove the line that has the IP.
After this is done save the file and reload apf to make the new changes active.

/etc/apf/apf -r

B) If the IP isn't already listed in deny_hosts.rules and you wish to allow it, this method adds the entry to allow_hosts.rules

 /etc/apf/apf -a IPHERE COMMENTHERENOSPACES
> The -a flag means ALLOW the IP address
> IPHERE is the IP address you wish to allow
> COMMENTSHERENOSPACES is obvious, add comments to why the IP is being removed These rules are loaded right away into the firewall, so they're instantly active.
Example:

./apf -a your_ip UNBLOCKING

pico /etc/apf/allow_hosts.rules

# added your_ip on 08/23/05 01:39:43
# UNBLOCKING
your_ip
