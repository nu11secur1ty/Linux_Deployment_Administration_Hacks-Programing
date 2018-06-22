![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/zombi/tjoOp.jpg)


A process is called a zombie process if the process has been completed, but its PID and process entry remains in the Linux process table. A process is removed from the process table when the process is completed, and its parent process reads the completed process' exit status by using the wait() system call. If a parent process fails to call wait() for whatever reason, its child process will be left in the process table, becoming a zombie.

# To find zombie processes on Linux:
```bash
ps axo stat,ppid,pid,comm | grep -w defunct
```
- Output
```xml
Z     250 10242 fake-prog <defunct>
```

Killing zombie processes is not obvious since zombie processes are already dead. You can try two options to kill a zombie process on Linux as follows.

First, you can try sending SIGCHLD signal to the zombie's parent process using the kill command. Note that the above command gives you PPID (PID of parent process) of each zombie. In our example, PPID of the zombie is 250.

```bash
sudo kill -s SIGCHLD 250
kill -s SIGCHLD 250
```
- ***If a zombie process still does not go away, you can kill the parent process (e.g., 250) of the zombie.***
```bash
 sudo kill -9 250
 kill -9 250
```

Once its parent process gets killed, the zombie will be adopted by the init process, which is a parent of all processes in Linux. The init process periodically calls wait() to reap any zombie process.

-------------------------------------------------------------------------------------------------------------

# Get the Zombie from process list.
```bash
ps aux |grep "defunct"
```
#  List the PID of Zombie
```bash
ps aux | awk '{ print $8 " " $2 }' | grep -w Z
```

#  find the parent process.

```bash 
pstree -paul
```
# Now you need to kill the parent process
```bash 
kill -9 _pid_
killall -9 _pid_
```

# Feel with better performance with nu11secur1ty ;)
