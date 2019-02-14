# Creating and Accessing a Two-Dimensional Array

There are many kinds of nested data structures. The simplest kind to build is an array of arrays, also called a two-dimensional array or a matrix. (The obvious generalization applies: an array of arrays of arrays is a three-dimensional array, and so on for higher dimensions.) It's reasonably easy to understand, and nearly everything that applies here will also be applicable to the fancier data structures that we'll explore in subsequent sections.

# Explain the code:
```perl
#!/usr/bin/perl
# author V.Varbanovski @nu11secur1ty
use warnings;
use strict;
use diagnostics;

# Assign a list of array references to an array.
our @gozba = (
	[ "krastavici", "chesun" ],
	[ "mleko", "mamule", "siranie" ],
	[ "kratofe", "kashkaval", "krushi" ],
);

print "Za taratora trebva\n"; 
print "$gozba[0][0]\n"; 
print "$gozba[0][1]\n";
print "$gozba[1][0]\n";
```
- print "$gozba[0][0]\n";
***First part from the printing of the element*** **[0]** ***mean the first line of the references array "line array element"***
***Second part from the printing of the element*** **[1]** ***mean the element from the references array***


