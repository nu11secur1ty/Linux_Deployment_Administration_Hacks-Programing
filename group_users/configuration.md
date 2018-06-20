# chown command
- chown command changes the user and/or group ownership of for given file. The syntax is:

```bash
chown owner-user file 
chown owner-user:owner-group file
chown owner-user:owner-group directory
chown options owner-user:owner-group file
```
# Add a New Group

If you want to create a new group on your system, use the groupadd command following command, replacing new_group with the name of the group you want to create. You’ll need to use sudo with this command as well (or, on Linux distributions that don’t use sudo, you’ll need to run the su command on its own to gain elevated permissions before running the command).
```bash
groupadd mynewgroup
```

# Add an Existing User Account to a Group

To add an existing user account to a group on your system, use the usermod command, replacing examplegroup with the name of the group you want to add the user to andexampleusername  with the name of the user you want to add.

```bash
usermod -a -G examplegroup exampleusername
```

# Change a User’s Primary Group

While a user account can be part of multiple groups, one of the groups is always the “primary group” and the others are “secondary groups”. The user’s login process and files and folders the user creates will be assigned to the primary group.

To change the primary group a user is assigned to, run the usermod command, replacingexamplegroup  with the name of the group you want to be the primary and exampleusernamewith the name of the user account.

```bash
usermod -g groupname username
```

# Create a New User and Assign a Group in One Command

You may sometimes want to create a new user account that has access to a particular resource or directory, like a new FTP user. You can specify the groups a user account will be assigned to while creating the user account with the useradd command, like so:

```bash
useradd -G examplegroup exampleusername
```


# Add a User to Multiple Groups

While assigning the secondary groups to a user account, you can easily assign multiple groups at once by separating the list with a comma.

```bash
usermod -a -G group1,group2,group3 exampleusername
```



