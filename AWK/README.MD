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

 
