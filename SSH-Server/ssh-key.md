# Secure Socket Shell(SSH)
`SSH, also known as Secure Shell or Secure Socket Shell, is a network protocol that gives users, particularly system administrators, a secure way to access a computer over an unsecured network. SSH also refers to the suite of utilities that implement the SSH protocol. Secure Shell provides strong authentication and encrypted data communications between two computers connecting over an open network such as the internet. SSH is widely used by network administrators for managing systems and applications remotely, allowing them to log into another computer over a network, execute commands and move files from one computer to another.`


# Generate pub key:
```bash
ssh-keygen -t rsa -b 7000
```
# Installing on a remote machine:
```bash
ssh-copy-id root@1.1.1.1
```
# User permission of directory, if you want to use public key
```bash
ls -ld /root/
must be 700
drwx------ 29 root root 4096 Jun 20 21:58 /root/
```
# And all in .ssh node must be with this privileges...
```bash
ls -ld /root/.ssh/*
-rw------- 1 root root 1679 Apr 21 00:05 /root/.ssh/id_rsa
-rw------- 1 root root  391 Apr 21 00:05 /root/.ssh/id_rsa.pub
-rw-r--r-- 1 root root 1110 Jun 19 23:51 /root/.ssh/known_hosts
```

# Have fun ;)
