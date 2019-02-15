![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/Linux_Tasks/Penguin-task.jpg)
# count runnig processes - Bonus :)

```bash
  ps -e -o s | grep -o 'R' -c
```
# Check for sleeping processes - Bonus :)
```bash
ps -e -o s | grep -o 'S' -c
ps h -eo s,pid | awk '{ if ($1 == "S" || $1 == "D") { print $2 } }'      #by PID'S
```
# To see Linux Tasks:

```bash
   top -b -n1 > tasks.log && cat tasks.log | grep Tasks && rm tasks.log
```
# Check for zombie pattern     - Bonus :)
```bash
pstree | grep _your_proc_name_
```
