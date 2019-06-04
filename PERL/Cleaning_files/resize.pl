#!/usr/bin/perl 
# author V.Varbanovski @nu11secur1ty
use strict;
use warnings;
use diagnostics;

my $file = "/your/path/to/file.out";
my $size = '10MB';
my $check_file_size = `du -sh $file`;
	if($check_file_size lt $size){
		my $truncate = `truncate -s $size $file`;
		}
my $last_check = `du -sh $file`;
  print "$last_check\n";
exit 0;
