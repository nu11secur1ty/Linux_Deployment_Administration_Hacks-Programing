#!/usr/bin/perl
# author @nu11secur1ty
use strict;
use warnings;
use diagnostics;
 
my $file = 'counter.txt';
my $count = 0;
 
# Open and lock the file counter.txt
if (open my $fh, "+< $file") {
    $count = <$fh>;
    close $fh;
}
 
$count++;
print "$count\n";
# Unlock and add count number in to a counter.txt
if (open my $fh, "> $file") {
	print $fh $count;
    close $fh;
    }
