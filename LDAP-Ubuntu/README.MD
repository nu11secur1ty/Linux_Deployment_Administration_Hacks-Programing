# Ubuntu 20.04
# OpenLDAP : Configure LDAP Server

```bash
root@dlp:~# apt -y install slapd ldap-utils
# set LDAP admin password during installation like follows
 +--------------------------| Configuring slapd |-------------------------+
 | Please enter the password for the admin entry in your LDAP directory.  |
 |                                                                        |
 | Administrator password:                                                |
 |                                                                        |
 | ********______________________________________________________________ |
 |                                                                        |
 |                                 <Ok>                                   |
 |                                                                        |
 +------------------------------------------------------------------------+

# confirm settings
root@dlp:~# slapcat
dn: dc=srv,dc=world
objectClass: top
objectClass: dcObject
objectClass: organization
o: srv.world
dc: srv
structuralObjectClass: organization
entryUUID: 102bac62-27a4-103a-853d-bb5d839899a7
creatorsName: cn=admin,dc=srv,dc=world
createTimestamp: 20200511072332Z
entryCSN: 20200511072332.363512Z#000000#000#000000
modifiersName: cn=admin,dc=srv,dc=world
modifyTimestamp: 20200511072332Z

dn: cn=admin,dc=srv,dc=world
objectClass: simpleSecurityObject
objectClass: organizationalRole
cn: admin
description: LDAP administrator
userPassword:: e1NTSEF9ekcwNmk4Ny9OZjdEL2RGUlhDcHRWV2hxaVZiaGo0b3c=
structuralObjectClass: organizationalRole
entryUUID: 10303c6e-27a4-103a-853e-bb5d839899a7
creatorsName: cn=admin,dc=srv,dc=world
createTimestamp: 20200511072332Z
entryCSN: 20200511072332.393446Z#000000#000#000000
modifiersName: cn=admin,dc=srv,dc=world
modifyTimestamp: 20200511072332Z
```
-------------------------------------------------------------------------------
# OpenLDAP : Configure LDAP Client

```bash
root@node01:~# apt -y install libnss-ldap libpam-ldap ldap-utils
(1) specify LDAP server's URI
 +---------------------| Configuring ldap-auth-config |----------------------+
 | Please enter the URI of the LDAP server to use. This is a string in the   |
 | form of ldap://<hostname or IP>:<port>/. ldaps:// or ldapi:// can also    |
 | be used. The port number is optional.                                     |
 |                                                                           |
 | Note: It is usually a good idea to use an IP address because it reduces   |
 | risks of failure in the event name service problems.                      |
 |                                                                           |
 | LDAP server Uniform Resource Identifier:                                  |
 |                                                                           |
 | ldap://dlp.srv.world/_________________________________________________    |
 |                                                                           |
 |                                  <Ok>                                     |
 |                                                                           |
 +---------------------------------------------------------------------------+

(2) specify suffix
 +---------------------| Configuring ldap-auth-config |----------------------+
 | Please enter the distinguished name of the LDAP search base. Many sites   |
 | use the components of their domain names for this purpose. For example,   |
 | the domain "example.net" would use "dc=example,dc=net" as the             |
 | distinguished name of the search base.                                    |
 |                                                                           |
 | Distinguished name of the search base:                                    |
 |                                                                           |
 | dc=srv,dc=world_______________________________________________________    |
 |                                                                           |
 |                                  <Ok>                                     |
 |                                                                           |
 +---------------------------------------------------------------------------+

(3) specify LDAP version (generally OK to select Version [3])
  +---------------------| Configuring ldap-auth-config |---------------------+
  | Please enter which version of the LDAP protocol should be used by        |
  | ldapns. It is usually a good idea to set this to the highest available   |
  | version.                                                                 |
  |                                                                          |
  | LDAP version to use:                                                     |
  |                                                                          |
  |                                    3                                     |
  |                                    2                                     |
  |                                                                          |
  |                                                                          |
  |                                  <Ok>                                    |
  |                                                                          |
  +--------------------------------------------------------------------------+

(4) select the one you like. (this example selects [Yes])
 +---------------------| Configuring ldap-auth-config |----------------------+
 |                                                                           |
 | This option will allow you to make password utilities that use pam to     |
 | behave like you would be changing local passwords.                        |
 |                                                                           |
 | The password will be stored in a separate file which will be made         |
 | readable to root only.                                                    |
 |                                                                           |
 | If you are using NFS mounted /etc or any other custom setup, you should   |
 | disable this.                                                             |
 |                                                                           |
 | Make local root Database admin:                                           |
 |                                                                           |
 |                    <Yes>                       <No>                       |
 |                                                                           |
 +---------------------------------------------------------------------------+

(5) select the one you like. (this example selects [No])
    +-------------------| Configuring ldap-auth-config |-------------------+
    |                                                                      |
    | Choose this option if you are required to login to the database to   |
    | retrieve entries.                                                    |
    |                                                                      |
    | Note: Under a normal setup, this is not needed.                      |
    |                                                                      |
    | Does the LDAP database require login?                                |
    |                                                                      |
    |                   <Yes>                      <No>                    |
    |                                                                      |
    +----------------------------------------------------------------------+

root@node01:~# vi /etc/nsswitch.conf
# line 7: add
passwd:         files systemd ldap
group:          files systemd ldap
shadow:         files

root@node01:~# vi /etc/pam.d/common-password
# line 26: change ( remove [use_authtok] )
password        [success=1 user_unknown=ignore default=die]     pam_ldap.so try_first_pass

root@node01:~# vi /etc/pam.d/common-session
# add to the end if need (create home directory automatically at initial login)
session optional        pam_mkhomedir.so skel=/etc/skel umask=077
root@node01:~# exit
Ubuntu 20.04 LTS node01.srv.world ttyS0

node01 login: focal     # LDAP user
Password:
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.4.0-26-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Mon 11 May 2020 04:54:21 PM JST

  System load:  0.44              Processes:               134
  Usage of /:   9.0% of 24.54GB   Users logged in:         0
  Memory usage: 4%                IPv4 address for enp1s0: 10.0.0.51
  Swap usage:   0%

.....
.....

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

Creating directory '/home/focal'.

focal@node01:~$      # just logined

# changing password is like follows
focal@node01:~$ passwd
Enter login(LDAP) password:     # current one
New password:                   # new one
Re-enter new password:
LDAP password information changed for disco
passwd: password updated successfully
focal@node01:~$                 # changed
```
