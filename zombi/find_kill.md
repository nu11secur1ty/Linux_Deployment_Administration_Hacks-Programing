A process is called a zombie process if the process has been completed, but its PID and process entry remains in the Linux process table. A process is removed from the process table when the process is completed, and its parent process reads the completed process' exit status by using the wait() system call. If a parent process fails to call wait() for whatever reason, its child process will be left in the process table, becoming a zombie.

# To find zombie processes on Linux:
```bash
ps axo stat,ppid,pid,comm | grep -w defunct
```
- Output
