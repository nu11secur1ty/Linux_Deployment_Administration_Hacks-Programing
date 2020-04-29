# Reset The Firewall UFW
- Step 1: Disabling ufw

By disabling ufw, we’re allowing all connections through. If, after executing the command below, you are able to connect via SSH, or to your website/application, the firewall was blocking your connection attempt and you can move forward with the next steps. If you are still unable to access your Droplet via SSH, or access to your website/application continues to be blocked, there may be another issue preventing access.

```bash
sudo ufw --force disable
```
- Step 2: Resetting ufw
Resetting ufw will clear/remove all existing rules and allow us to start from a clean slate.
```bash
sudo ufw --force reset
```
- Step 3: Deny All Incoming Connections
By denying all incoming connections, we’re using the whitelist method of allowing access only on the ports that we define. We’ll define those ports in Step 5.

```bash
sudo ufw default deny incoming
```
- Step 4: Allow All Outgoing Connections
By allowing all outgoing connections, we’re allowing any connection from the Droplet to the outside world, regardless of which port the connection is being made on. Unless you have a specific use case for limiting outgoing connections, it’s best to allow all.

```bash
sudo ufw default allow outgoing
```
- Step 5: Defining Ports That Allow Connections
For the purpose of this mini guide, we’re focused on three primary ports (listed below), though you can add additional ports through the firewall at any time (without having to repeat steps 1-4). The command to add a port through remains the same, only the port will change.

. Common Ports
. SSH - Port 22
. HTTP - Port 80
. HTTPS - Port 443

Allow TCP connections on Port 22

```bash
sudo ufw allow 22/tcp
```
Allow TCP connections on Port 80
```bash
sudo ufw allow 80/tcp
```
Allow TCP connections on Port 443
```bash
sudo ufw allow 443/tcp
```
- Step 6: Enabling ufw
Now that we’ve reset the firewall and defined our whitelisted ports, we’ll enable ufw which will enforce the rules that we’ve put in to place.

```bash
sudo ufw --force enable
```

- Additional Ports

MongoDB
```bash
sudo ufw allow 27017/tcp
```
MySQL
```bash
sudo ufw allow 3306/tcp
```
Postgres
```bash
sudo ufw allow 5432/tcp
```
Redis
```bash
sudo ufw allow 6379/tcp
```


# List Existing firewall rules
- The following linux command will list all currently used firewall rules. Example:

```bash
sudo ufw status numbered
```
- Output
```
Status: active

     To                         Action      From
     --                         ------      ----
[ 1] Apache Full                ALLOW IN    Anywhere                  
[ 2] OpenSSH                    ALLOW IN    Anywhere                  
[ 3] Apache Full (v6)           ALLOW IN    Anywhere (v6)             
[ 4] OpenSSH (v6)               ALLOW IN    Anywhere (v6)
```
# Remove Firewall Rule

Each firewall rule is numbered from 1 to N. Using a relevant firewall rule number we can selectively remove any given rule. For example:

```bash
sudo ufw delete 3
```
- Output
```
Deleting:
 allow 'Apache Full'
Proceed with operation (y|n)? y
Rule deleted (v6)
```

The above command will remove firewall rule number 3. Please note, you can only remove one rule at the time. The rule numbering will change every time you make a change:

```bash
sudo ufw status numbered
Status: active

     To                         Action      From
     --                         ------      ----
[ 1] Apache Full                ALLOW IN    Anywhere                  
[ 2] OpenSSH                    ALLOW IN    Anywhere                  
[ 3] OpenSSH (v6)               ALLOW IN    Anywhere (v6)
```

# Default
ufw default deny incoming
ufw default allow incoming

# Services
ufw allow ssh # for special
ufw deny ssh # for all
ufw allow from 0.0.0.0/24 to any port 00
ufw allow from 0.0.0.0 to any port 00


# Allow service listening on port 
ufw allow from 0.0.0.0/24 to any port 0000
ufw allow from 0.0.0.0 to any port 0000

# Deny service listening on port 
ufw deny from 0.0.0.0/24 to any port 0000
ufw deny from 0.0.0.0 to any port 0000

# Deny any all usoing special port
ufw deny 0000/tcp

# Allow any all usoing special port
ufw deny 0000/tcp
