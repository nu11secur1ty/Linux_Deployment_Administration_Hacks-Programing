# Print mysql cpu, mem usage from top in one sec.
```bash
top -n 1 -p `pgrep -f mysqld | tr '\n' , | sed s/,$//`
```
- Using ps

```bash
ps -o %mem -p $(pidof mysqld) | tail +2
ps -o %mem,%cpu -p $(pidof mysqld) | tail +2
```
