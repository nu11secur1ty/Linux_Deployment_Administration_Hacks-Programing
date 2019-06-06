#!/usr/bin/perl
use warnings;
use strict;
use diagnostics;

our @pingsi_traceroute = ('ping 8.8.4.4 -c 4', 'ping 8.8.8.8 -c 4',
                         'traceroute 8.8.4.4 -m4', 'traceroute 8.8.8.8 -m4');
foreach (@pingsi_traceroute) {
                print "Testing a ping_traceroute $_\n";
                        our $check_ping = `$_`;
                        print "$check_ping";
                print "Ping_traceroute is tested\n---------------------\n";
        }
exit 0;
