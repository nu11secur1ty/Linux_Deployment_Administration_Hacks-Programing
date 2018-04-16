# Starting firefox script:

```bash
#!/usr/bin/bash
export DISPLAY=:1
   open firefox-esr &
sleep 30s;
   killall -9 firefox-esr
exit 1;
```
