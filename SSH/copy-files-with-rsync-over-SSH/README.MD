# Requirements

- CentOS, Debian or Ubuntu installed on your computer/server
- SSH access (Command line access to the server)
- root privileges
- Basic skills for working on a Linux environment

```txt
Rsync is a great tool that allows you to transfer and synchronize data between servers. The command can be used over SSH which encrypts the connection. It also provides large amount of options which can be used such as archive mode, backup mode, data compression during the transfer etc.
```

# Check SSH configuration

```bash
ssh user1@X.X.X.X
```
where X.X.X.X is the remote server's IP address. Instead an IP address a hostname can be used as well.

If the connection is successful then you should not experience problems initiating the transfer.

Depending on the SSH authentication method configured on the server you might be prompted to fill in SSH password or key passphrase upon execution of the rsync command.

```xml
Transfer data using rsync
```
- Copy a file from local server to remote one:
```bash
rsync -v -e ssh /home/localuser/testfile.txt remoteuser@X.X.X.X:/home/remoteuser/transfer
```
In the above example we will copy a file called testfile.txt from the current server to the remote one and will place it inside the `folder /home/remoteuser/transfer`.

The output should be similar to the following one:

```bash
sent X bytes  received X bytes  X.X bytes/sec
total size is X  speedup is X.X
```
If the remote server is configured to work with non-default SSH port (other than 22) we can specify that inside the -e option:

```bash
rsync -v -e "ssh -p2222" /home/localuser/testfile.txt remoteuser@X.X.X.X:~/transfer
```

Again the testfile.txt will be copied inside the /home/remoteuser/transfer folder situated on the remote server.

Copy a file from remote server into a local folder:

```bash
rsync -v -e ssh remoteuser@X.X.X.X:/home/remoteuser/transfer/testfile.txt /home/localuser/
```

In the above example we will copy a file called testfile.txt from the remote server inside a local folder called `/home/localuser/`.

Synchronize local folder on remote server:

```bash
rsync -r -a -v -e ssh --delete /home/localuser/testfolder remoteuser@X.X.X.X:/home/remoteuser/testfolder
```
Synchronize folder from the remote server on the local server:

```bash
rsync -r -a -v -e ssh --delete remoteuser@X.X.X.X:/home/remoteuser/testfolder /home/localuser/testfolder
```
***IMPORTANT***
- Use of "/" at the end of path:

If "/" is placed at the end of the source folder, rsync will copy one the content of the folder.
When not using "/" at the end of source folder, rsync will copy the folder itself and the content of the folder.

If "/" is placed at the end of the destination folder, rsync will paste the data directly inside the folder.
When not using "/" at the end of destination folder, rsync will create a folder with that name and paste the data inside that folder.

Here is a list of some of the most common rsync options:

- --delete - delete files that don't exist on sender (system)
- -v - verbose (-vv will provide more detailed information)
- -e "ssh options" - specify the ssh as remote shell
- -a - archive mode - it preserves permissions (owners, groups), times, symbolic links, and devices
- -r - recurse into directories
- -z - compress file data during transfer
- -exclude 'foldername' – excludes the corresponding folder from transfer
- -P – show progress during transfer
