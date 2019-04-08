# Print mysql cpu, mem usage from top in one sec.
```bash
top -n 1 -p `pgrep -f mysqld | tr '\n' , | sed s/,$//`
```
