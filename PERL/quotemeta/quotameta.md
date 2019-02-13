- quotemeta

Returns the value of EXPR with all the ASCII non-"word" characters backslashed. (That is, all ASCII characters not matching /[A-Za-z_0-9]/ will be preceded by a backslash in the returned string, regardless of any locale settings.) This is the internal function implementing the \Q escape in double-quoted strings. (See below for the behavior on non-ASCII code points.)

If EXPR is omitted, uses $_ .

quotemeta (and \Q ... \E ) are useful when interpolating strings into regular expressions, because by default an interpolated variable will be considered a mini-regular expression. For example:

------------------------------------------------------------------------------------------------------------------------------

```perl 
#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

        my $sentence = 'The quick brown fox jumped over the lazy dog';
        my $substring = 'quick.*?fox';
                $sentence =~ s{$substring}{big bad wolf};
        print "$sentence\n";
```
- Output
```
The big bad wolf jumped over the lazy dog
```
