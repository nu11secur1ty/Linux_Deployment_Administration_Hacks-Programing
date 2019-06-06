#!/usr/bin/perl
# by V.Varbanovski @nu11secur1ty
use warnings;
use strict;
use diagnostics;

our @pings = ('ping 8.8.4.4 -c 4', 'ping 8.8.8.8 -c 4');
foreach (@pings) {
		print "Testing a ping $_\n";
        		our $check_ping = `$_`;
			print "$check_ping";
		print "Ping is tested\n---------------------\n";
	}
exit 0;
