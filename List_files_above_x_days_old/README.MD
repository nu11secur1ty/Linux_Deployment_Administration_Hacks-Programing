`With this program, you can find files in folders older than x days.
You must show on the program how days you want to check.`
- Example:

```bash
find $i -mtime +5 | xargs ls -ltr;
```
