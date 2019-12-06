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
- Nginx
```bash
grep -r "mydomain.com" /etc/nginx/
```
- output
/etc/nginx/sites-available/mydomain.com.vhost:        if ($http_host != "www.mydomain.com") {



#  search only for words
```bash
grep -w "piche" file
```


# search two different words

```bash
egrep -w 'piche|pute' /path/to/file
```
# lines for matched words

```bash
grep -c 'krastavici' /path/to/file
```
```bash
grep -n 'root' /etc/passwd
```
- output
1:root:x:0:0:root:/root:/bin/bash

# invert match
Users may make use of the -v option to print inverts the match, which means it would match only those lines that do not contain the given word. For instance, print all lines that do not contain the word par by using the following command:
```bash
grep -v parer /path/to/file
```

# list only the names of matching files

```bash
grep -l 'primary' *.c
```
- color
```bash
grep --color root /etc/passwd
```
# handle multiple search patterns

There could be situations wherein you might want to search multiple patterns in a given file (or set of files). In such scenarios, you should use the '-e' command-line option that grep provides.

For example, suppose you want to search for words "how", "to", and "forge" in all the text files present in your current working directory, then here's how you can do this:

```bash
grep -e how -e to -e forge *.txt
```










































































