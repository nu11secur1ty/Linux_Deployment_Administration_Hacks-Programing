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
- Granted access to network 192.168.1.0/24 with the exception of the address 192.168.1.1.















