# chown command
- chown command changes the user and/or group ownership of for given file. The syntax is:

```bash
chown owner-user file 
chown owner-user:owner-group file
chown owner-user:owner-group directory
chown options owner-user:owner-group file
```
# Add an Existing User Account to a Group

To add an existing user account to a group on your system, use the usermod command, replacing examplegroup with the name of the group you want to add the user to andexampleusername  with the name of the user you want to add.

```bash
usermod -a -G examplegroup exampleusername
```

