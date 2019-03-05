Sr.No. 	Pattern & Description
1 	

^

Matches beginning of line.
2 	

$

Matches end of line.
3 	

.

Matches any single character except newline. Using m option allows it to match newline as well.
4 	Sr.No. 	Pattern & Description
1 	

^

Matches beginning of line.
2 	

$

Matches end of line.
3 	

.

Matches any single character except newline. Using m option allows it to match newline as well.
4 	

[...]

Matches any single character in brackets.
5 	

[^...]

Matches any single character not in brackets.
6 	

*

Matches 0 or more occurrences of preceding expression.
7 	

+

Matches 1 or more occurrence of preceding expression.
8 	

?

Matches 0 or 1 occurrence of preceding expression.
9 	

{ n}

Matches exactly n number of occurrences of preceding expression.
10 	

{ n,}

Matches n or more occurrences of preceding expression.
11 	

{ n, m}

Matches at least n and at most m occurrences of preceding expression.
12 	

a| b

Matches either a or b.
13 	

\w

Matches word characters.
14 	

\W

Matches nonword characters.
15 	

\s

Matches whitespace. Equivalent to [\t\n\r\f].
16 	

\S

Matches nonwhitespace.
17 	

\d

Matches digits. Equivalent to [0-9].
18 	

\D

Matches nondigits.
19 	

\A

Matches beginning of string.
20 	

\Z

Matches end of string. If a newline exists, it matches just before newline.
21 	

\z

Matches end of string.
22 	

\G

Matches point where last match finished.
23 	

\b

Matches word boundaries when outside brackets. Matches backspace (0x08) when inside brackets.
24 	

\B

Matches nonword boundaries.
25 	

\n, \t, etc.

Matches newlines, carriage returns, tabs, etc.
26 	

\1...\9

Matches nth grouped subexpression.
27 	

\10

Matches nth grouped subexpression if it matched already. Otherwise refers to the octal representation of a character code.
28 	

[aeiou]

Matches a single character in the given set
29 	

[^aeiou]

Matches a single character outside the given set

[...]

Matches any single character in brackets.
5 	

[^...]

Matches any single character not in brackets.
6 	

*

Matches 0 or more occurrences of preceding expression.
7 	

+

Matches 1 or more occurrence of preceding expression.
8 	

?

Matches 0 or 1 occurrence of preceding expression.
9 	

{ n}

Matches exactly n number of occurrences of preceding expression.
10 	

{ n,}

Matches n or more occurrences of preceding expression.
11 	

{ n, m}

Matches at least n and at most m occurrences of preceding expression.
12 	

a| b

Matches either a or b.
13 	

\w

Matches word characters.
14 	

\W

Matches nonword characters.
15 	

\s

Matches whitespace. Equivalent to [\t\n\r\f].
16 	

\S

Matches nonwhitespace.
17 	

\d

Matches digits. Equivalent to [0-9].
18 	

\D

Matches nondigits.
19 	

\A

Matches beginning of string.
20 	

\Z

Matches end of string. If a newline exists, it matches just before newline.
21 	

\z

Matches end of string.
22 	

\G

Matches point where last match finished.
23 	

\b

Matches word boundaries when outside brackets. Matches backspace (0x08) when inside brackets.
24 	

\B

Matches nonword boundaries.
25 	

\n, \t, etc.

Matches newlines, carriage returns, tabs, etc.

-----------------------------------------------------
26 	
\1...\9

Matches nth grouped subexpression.

------------------------------------------------------
27. 	\10

Matches nth grouped subexpression if it matched already. Otherwise refers to the octal representation of a character code.

-----------------------------------------------------
28. 	[aeiou]

Matches a single character in the given set

-----------------------------------------------------
29. 	[^aeiou]

Matches a single character outside the given set
