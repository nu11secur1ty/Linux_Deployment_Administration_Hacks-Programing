#!/usr/bin/perl
# author V.Varbanovski @nu11secur1ty
use strict;
use warnings;
use diagnostics;
       

my $var1 = 1 + 1;
	if( defined($var1) ) {
		print "The var1 is defined result: $var1\n";
	}
	if( defined(my $var2) ) {
   		print "var2 is also defined\n";
	} else {
   		print "var2 is not defined\n";
	}
exit 0;
