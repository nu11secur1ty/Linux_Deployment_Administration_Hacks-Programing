# quickly get only last modify date, you can type:

```bash
ls -lit /path
```

- - - with -t option you list all file in /path odered by last modify date.

# List all files on the directory

```bash
ls -lit /path *
```

# Check by using `stat`

```bash
stat -c '%y %d' /path/file.txt
```
