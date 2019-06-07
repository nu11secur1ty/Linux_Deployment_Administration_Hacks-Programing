`With this program, you can find files in folders older than x days.
You must show on the program how days you want to check.`

- Example:

```bash
tupotii=( folder0 folder1 folder2 )

for i in "${tupotii[@]}"
do       
	find $i -mtime +`your days` | xargs ls -ltr;
done
	echo "Djanki"
exit 0;
```
