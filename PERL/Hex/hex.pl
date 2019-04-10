#!/usr/bin/perl
# author@nu11secur1ty
use strict;
use warnings;
use diagnostics;

my $kRtrdfs = "68747470733a2f2f7777772e6e75313173656375723174792e636f6d2f";
	$kRtrdfs =~ s/([a-fA-F0-9][a-fA-F0-9])/chr(hex($1))/eg;
	print "$kRtrdfs\n";
exit 0;
