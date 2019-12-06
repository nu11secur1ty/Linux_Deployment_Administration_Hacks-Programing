# The basic grep command syntax

```bash
grep 'word' filename
grep 'word' file1 file2 file3
grep 'string1 string2'  filename
cat otherfile | grep 'something'
command | grep 'something'
command option1 | grep 'data'
grep --color 'data' fileName
```
# searching in a file

```bash
grep prostak /etc/passwd
```
- output
prostak:x:1000:1000:tom,,,:/home/tom:/bin/bash

```bash
grep -i "prostak" /etc/passwd
```
# Recursive use of grep

```bash
grep -r "mydomain.com" /etc/apache2/
grep -R "mydomain.com" /etc/apache2/
```
- output
grep -r "mydomain.com" /etc/nginx/
/etc/nginx/sites-available/mydomain.com.vhost:        if ($http_host != "www.mydomain.com") {


























