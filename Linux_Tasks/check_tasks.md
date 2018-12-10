[](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/Linux_Tasks/Penguin-task.jpg)
# You can see them and count them ;) - Bonus :)

```bash
  ps -e -o s | grep -o 'R' -c
```
# To see Linux Tasks:

```bash
   top -b -n1 > tasks.log && cat tasks.log | grep Tasks && rm tasks.log
```
# Check for zombie pattern     - Bonus :)
```bash
pstree | grep _your_proc_name_
```
