# Print mysql cpu, mem usage from top in one sec.
```bash
top -n 1 -p `pgrep -f mysqld | tr '\n' , | sed s/,$//`
```
- Using ps

```bash
ps -eo %mem -S -p $(pgrep mysqld) | tail +2
ps -eo %mem,%cpu -S -p $(pgrep mysqld) | tail +2
```
