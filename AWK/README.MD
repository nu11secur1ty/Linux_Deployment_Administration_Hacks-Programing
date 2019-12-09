# AWK command in Linux

-  prints every line

```bash
 awk '{print}' employee.txt
```
. out 
```
ajay manager account 45000
sunil clerk account 25000
varun manager sales 50000
amit manager account 47000
tarun peon sales 15000
deepak clerk sales 23000
sunil peon sales 13000
satvik director purchase 80000 
```

- Print the lines which matches with the given pattern.

```bash
awk '/manager/ {print}' employee.txt
```
- out
```
ajay manager account 45000
varun manager sales 50000
amit manager account 47000 
```

- Splitting a Line Into Fields

```bash
awk '{print $1,$4}' employee.txt 
```
. out
```
ajay 45000
sunil 25000
varun 50000
amit 47000
tarun 15000
deepak 23000
sunil 13000
satvik 80000 
```
- Use of NR built-in variables (Display Line Number)

```bash
awk '{print NR,$0}' employee.txt 
```
. out

```
1 ajay manager account 45000
2 sunil clerk account 25000
3 varun manager sales 50000
4 amit manager account 47000
5 tarun peon sales 15000
6 deepak clerk sales 23000
7 sunil peon sales 13000
8 satvik director purchase 80000
```
- Use of NF built-in variables (Display Last Field)

```bash
awk '{print $1,$NF}' employee.txt
```
. out

```
ajay 45000
sunil 25000
varun 50000
amit 47000
tarun 15000
deepak 23000
sunil 13000
satvik 80000 
```
-  NR built-in variables (Display Line From 3 to 6)
```bash
awk 'NR==3, NR==6 {print NR,$0}' employee.txt
```
. out
```
3 varun manager sales 50000
4 amit manager account 47000
5 tarun peon sales 15000
6 deepak clerk sales 23000
```
- print the first item along with the row number(NR) separated with ” – “ from each line in geeksforgeeks.txt

```bash
awk '{print NR "- " $1 }' geeksforgeeks.txt
```
. out

```
1 - Tarun
2 – Manav    
3 - Praveen
```

- return the second row/item from geeksforgeeks.txt:

```bash
awk '{print $2}' geeksforgeeks.txt
```
. out

```
A12
B6
M42
```
- print any non empty line if present
```bash
awk 'NF > 0' geeksforgeeks.txt
```
. out 
```
0
```
- find the length of the longest line present in the file
```bash
awk '{ if (length($0) > max) max = length($0) } END { print max }' geeksforgeeks.txt
```
. out
```
13
```
-  count the lines in a file

```bash
awk 'END { print NR }' geeksforgeeks.txt
```
. out
```
3
```
-  Printing lines with more than 10 characters
```bash
awk 'length($0) > 10' geeksforgeeks.txt
```
. out

```
Tarun    A12    1
Praveen    M42    3
```

-  find/check for any string in any column

```bash
awk '{ if($3 == "B6") print $0;}' geeksforgeeks.txt
```
- print the squares of first numbers from 1 to n say 6

```bash
awk 'BEGIN { for(i=1;i<=6;i++) print "square of", i, "is",i*i; }'
```


 
