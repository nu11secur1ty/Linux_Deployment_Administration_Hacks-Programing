#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

# не фактор
my $number = 7; # Change the number here 
my $fact = 1;

for( my $i = 1; $i <= $number ; $i=$i+1 ){
	$fact = $fact*$i;
	}
	print "Factorial of $number is: $fact";
exit 0;


