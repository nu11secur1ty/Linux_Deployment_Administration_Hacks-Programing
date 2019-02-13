# Perl foreach loops
![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/PERL/wall/blackboard-foreach.png)

A foreach loop runs a block of code for each element of a list. No big whoop, “perl foreach” continues to be one of the most popular on Google searches for the language. So we thought we’d see what’s happened in 20 years. I expand on Tom Christiansen’s slide that’s part of his longer presentation then add a new but experimental feature at the end. If you want more, there’s plenty to read in perlsyn or my book Learning Perl.

# Going through a list

Unless you say otherwise, foreach aliases the current element to the topic variable $_. You can specify that list directly in the parentheses after foreach, use an array variable, or use the result of a subroutine call (amongst other ways to get a list):

```perl
foreach ( 1, 3, 7 ) {
	print "\$_ is $_";
	}
```
------------------------------------------------------------------------------------------------------------------

```perl
my @numbers = ( 1, 3, 7 );
foreach ( @numbers ) {
	print "\$_ is $_";
	}
```
-------------------------------------------------------------------------------------------------------------------

```perl
sub numbers{ return ( 1, 3, 7 ) }
foreach ( numbers() ) {
	print "\$_ is $_";
	}
```
-------------------------------------------------------------------------------------------------------------------

```perl
sub numbers{ keys %some_hash }
foreach ( numbers() ) {
	print "\$_ is $_";
	}
```
-------------------------------------------------------------------------------------------------------------------

```css
Some people like to use the synonym for. There’s a proper C-style for that has three semicolon-separated parts in the parentheses. If Perl doesn’t see the two semicolons it treats for just like a foreach:
```
--------------------------------------------------------------------------------------------------------------------

```perl
for ( my $i = 0; $i < 5; $i++ ) {  # C style
	print "\$i is $i";
	}

for ( 0 .. 4 ) {  # foreach synonym
	print "\$_ is $_";
	}
```
--------------------------------------------------------------------------------------------------------------------

# Element source gotchas
```css
The aliasing is only temporary. After the foreach the topic variable returns to its original value:
```
--------------------------------------------------------------------------------------------------------------------
```perl
$_ = "Original value";
my @numbers = ( 1, 3, 7 );
print "\$_ before: $_\n";
foreach ( @numbers ) {
	print "\$_ is $_\n";
	$_ = $_ * 2;
	}
print "\$_ after: $_\n";
```
--------------------------------------------------------------------------------------------------------------------

```css
The output shows that $_ appears unaffected by the foreach:
```
--------------------------------------------------------------------------------------------------------------------

```txt
$_ before: Original value
$_ is 1
$_ is 3
$_ is 7
$_ after: Original value
```

This is an alias instead of a copy, which is a shortcut that allows your program to be a little faster by not moving data around. If you change the topic you change the original value if the list source is an array (the values are read-only otherwise and you’ll get an error):

--------------------------------------------------------------------------------------------------------------------

```perl 
my @numbers = ( 1, 3, 7 );
print "Before: @numbers\n";  # Before: 1 3 7
foreach ( @numbers ) {
	print "\$_ is $_\n";
	$_ = $_ * 2;
	}
print "After: @numbers\n";   # After: 2 6 14
```
---------------------------------------------------------------------------------------------------------------------
```css
Not only that, but if you change the source by adding or removing elements you can screw up the foreach. This loops infinitely processing the same element because each go through the block moves the array elements over one position; when the iterator moves onto the next position it finds the same one it just saw:
```
---------------------------------------------------------------------------------------------------------------------

```perl
my @numbers = ( 1, 3, 7 );
print "\$number before: $number\n";
foreach $number ( @numbers ) {
	print "\$number is $number\n";
	unshift @numbers, "Added later";
	}
```
---------------------------------------------------------------------------------------------------------------------

This output will go on forever:

---------------------------------------------------------------------------------------------------------------------

































