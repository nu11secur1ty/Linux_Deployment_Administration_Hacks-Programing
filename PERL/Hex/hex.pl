#!/usr/bin/perl
# author@nu11secur1ty
use strict;
use warnings;
use diagnostics;

my $string = "596f757220636f7079206f66207468697320636f64652066726f6d20736f6d657768657265";
 	$string =~ s/([a-fA-F0-9][a-fA-F0-9])/chr(hex($1))/eg;
  print "$string\n";
exit 0;
