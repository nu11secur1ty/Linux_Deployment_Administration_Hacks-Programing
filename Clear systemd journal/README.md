# Check size:

```bash
$ du -hs /var/log/journal/
4.1G	/var/log/journal/
```

# 4.1GB worth of journal files, with the oldest dating back over 2 months.

```bash
$ ls -lath /var/log/journal/*/ | tail -n 2
-rw-r-x---+ 1 root systemd-journal 8.0M Dec 24 05:15 user-xxx.journal
```

# Clear systemd journals older than X days
 - The first one is time-based, clearing everything holder than say 10 days.
 
```bash
$ journalctl --vacuum-time=10d
...
Vacuuming done, freed 2.3G of archived journals on disk.
```
- Alternatively, you can limit its total size.

# Clear systemd journals if they exceed X storage

- This example will keep 2GB worth of logs, clearing everything that exceeds this.

```bash
$ journalctl --vacuum-size=2G
...
Vacuuming done, freed 720.0M of archived journals on disk.
```
Afterwards, your `/var/log/journal` should be much smaller.

```bash
$ du -hs /var/log/journal
1.1G	/var/log/journal
```
# Saves you some GBs on disk!

# More...
- Link: ![Read](https://www.freedesktop.org/software/systemd/man/journald.conf.html)














