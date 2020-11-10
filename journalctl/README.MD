# Best Practice on System D

1. Display newest log entries first
- Use the -r option to display the newest log entries first.

```bash
# journalctl -r
-- Logs begin at Mon 2017-05-22 10:34:28 IST, end at Tue 2017-11-14 11:31:37 IST. --
Nov 14 11:31:37 geeklab systemd[1]: Stopping user-5006.slice.
Nov 14 11:31:37 geeklab systemd[1]: Removed slice user-5006.slice.
Nov 14 11:31:37 geeklab systemd-logind[71377]: Removed session 59130.
```

2. Display specific number of recent log entries
- Use the –n [number] option to display a specific number of the most recent log entries. The following example displays the three most recent log entries.
```bash
# journalctl -n 3
-- Logs begin at Mon 2017-05-22 10:34:28 IST, end at Tue 2017-11-14 11:40:08 IST. --
Nov 14 11:40:08 geeklab su[92886]: (to oracle) root on none
Nov 14 11:40:08 geeklab su[92886]: pam_unix(su-l:session): session opened for user oracle by (uid=0)
Nov 14 11:40:08 geeklab su[92886]: pam_unix(su-l:session): session closed for user oracle
```


3. Display log entries of specific priority
Use the –p [priority] option to display only log entries of a specific [priority]. Valid priorities are debug, info, notice, warning, err, crit, alert, and emerg. The following example displays only crit log entries. Entries with err priority and higher are in red.
```bash
# journalctl -p crit
-- Logs begin at Mon 2017-05-22 10:34:28 IST, end at Tue 2017-11-14 11:40:08 IST. --
May 22 10:35:55 geeklab logger[73478]: Starting agent
May 23 06:30:06 geeklab sudo[58493]:  hptools : parse error in /etc/sudoers near line 125 ; TTY=pts/0 ; PWD=/home/hptools ;
May 23 06:30:06 geeklab sudo[58498]:  hptools : parse error in /etc/sudoers near line 125 ; TTY=pts/0 ; PWD=/home/hptools ;
```

4. Display log entries only for specific systemd unit
Use the –u [systemd_unit] option to display only log entries for the specified systemd unit. The following example displays only log entries associated with the crond unit.
```bash
# journalctl -u ntpd
-- Logs begin at Mon 2017-05-22 10:34:28 IST, end at Tue 2017-11-14 12:01:40 IST. --
May 22 10:38:23 geeklab systemd[1]: Starting Network Time Service...
May 22 10:38:23 geeklab ntpd[124798]: ntpd 4.2.6p5@1.2349-o Tue May  3 14:43:00 UTC 2016 (1)
May 22 10:38:23 geeklab systemd[1]: Started Network Time Service.
```
5. Formatting the output
Use the –o [output_form] option to format the output. Valid output formats are short, short-iso, short-precise, short-monotonic, verbose, export, json, jsonpretty, json-see, and cat. Refer to the journalctl man page for a description of the output formats. The following example displays log entries using the verbose format.
```bash
# journalctl -o verbose
-- Logs begin at Mon 2017-05-22 10:34:28 IST, end at Tue 2017-11-14 12:05:12 IST. --
Mon 2017-05-22 10:34:28.596388 IST [s=2eb4bc19c06148158649a58c85bf5ffd;i=1;b=20687e1fa4ce4c78a372ea44f064aa3c;m=26fb2c;t=55015ce4328a4;x=da00a88e8477
    PRIORITY=6
    _TRANSPORT=driver
    MESSAGE=Runtime journal is using 8.0M (max allowed 4.0G, trying to leave 4.0G free of 125.8G available → current limit 4.0G).
    MESSAGE_ID=ec387f577b844b8fa948f33cad9a75e6
    _PID=742
    _UID=0
    _GID=0
    _COMM=systemd-journal
    _EXE=/usr/lib/systemd/systemd-journald
    _CMDLINE=/usr/lib/systemd/systemd-journald
    _CAP_EFFECTIVE=5402800cf
    _SYSTEMD_CGROUP=/system.slice/systemd-journald.service
    _SYSTEMD_UNIT=systemd-journald.service
    _SYSTEMD_SLICE=system.slice
...
```

6. Combining options
You can also combine various options used in the examples above as per your requirement. For example, to show the latest 3 log entries of priority critical, use the below command.

```bash
# journalctl -n 3 -p crit
-- Logs begin at Mon 2017-05-22 10:34:28 IST, end at Tue 2017-11-14 12:10:12 IST. --
Sep 07 04:35:29 geeklab sshd[21232]: fatal: Read from socket failed: Connection reset by peer [preauth]
Oct 26 19:39:33 geeklab sshd[34860]: fatal: Read from socket failed: Connection reset by peer [preauth]
Oct 26 19:39:34 geeklab sshd[34862]: fatal: Read from socket failed: Connection reset by peer [preau
```
7. All logs
```bash
# journalctl 
```
