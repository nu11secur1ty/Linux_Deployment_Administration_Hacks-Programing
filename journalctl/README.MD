# Best Practice on System D

1. Display newest log entries first
```bash
# journalctl -r
-- Logs begin at Mon 2017-05-22 10:34:28 IST, end at Tue 2017-11-14 11:31:37 IST. --
Nov 14 11:31:37 geeklab systemd[1]: Stopping user-5006.slice.
Nov 14 11:31:37 geeklab systemd[1]: Removed slice user-5006.slice.
Nov 14 11:31:37 geeklab systemd-logind[71377]: Removed session 59130.
```

