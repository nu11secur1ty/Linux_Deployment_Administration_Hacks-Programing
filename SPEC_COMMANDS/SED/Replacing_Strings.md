# Finding and Replacing Strings within files Using SedPermalink

- In some cases, the “in place” substitution with the -i argument provides the desired behavior. However, if you want to test a sed   operation, or provide a “safety net”, consider the following command:

```bash 
sed -r -i.bak 's/example/example/g' ~/roster.txt
```
- explain:
```bash 
sed -r -i.bak 's/original-string/change_string_with_original/g' ~/roster.txt
```
