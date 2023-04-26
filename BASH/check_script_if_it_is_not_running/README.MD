# checker

```bash 
#!/bin/bash
if [[ ! $(pgrep -f script.sh) ]]; then
    script.sh
fi
```

# Putting it in cronjob
```cron
* * * * *   bash /path/path/script.sh
```
