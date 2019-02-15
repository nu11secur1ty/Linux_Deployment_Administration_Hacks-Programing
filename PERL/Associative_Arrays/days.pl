#!/usr/bin/perl
# author V.Varbanovski @nu11secur1ty
use strict;
use warnings;
use diagnostics;

my @days = ('monday', 
	    'Tuesday', 
	    'Wensday', 
	    'Thursday', 
	    'Friday', 
	    'Saturday', 
	    'Sunday'
    );
	print "Choice day\n"; 
		my $day = <>;
		my $choice = $days[$day-1]; 	
	print "The day is $choice\n";
exit 0;
