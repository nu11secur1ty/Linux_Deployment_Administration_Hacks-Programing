#!/usr/bin/perl
# author V.Varbanovski @nu11secur1ty

use strict;
use warnings;
use diagnostics;

my $str = q(The stupid said, "Don't do that.");
	$str =~ s/[,."']//g;
	print "$str\n";
