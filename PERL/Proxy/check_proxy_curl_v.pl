#!/usr/bin/perl
# author V.Varbanovski @nu11secur1ty
use strict;
use warnings;
use diagnostics;

our $clean = `cat /dev/null > /path/outputproxy.txt`;
our @proxys = ('0.0.0.0 0000', '0.0.0.0 0000', '0.0.0.0 0000', 
	'0.0.0.0 0000', '0.0.0.0 0000', '0.0.0.0 0000', '0.0.0.0 0000');

	foreach (@proxys) {
		print "Proxy testing $_\n";
        		our $check_proxy = `curl -v $_  http://www.example.com/ >> /path/outputproxy.txt 2>&1`;
		print "proxies is tested\n---------------------\n";
	}
	     my $clean_nc = `pgrep -f nc`;
	     	print "Check netcat for sleeping processes:$clean_nc\n";
	     	print "Please see the result in 'outputproxy.txt'\n";
                	print "command: cat outputproxy.txt\n";
			our $time_check = `date >> /path/outputproxy.txt 2>&1`;

exit 0;
