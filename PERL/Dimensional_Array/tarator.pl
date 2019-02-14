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
