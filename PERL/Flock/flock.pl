#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

print "Type your message here...\n";
my $msg = <STDIN>;
# import LOCK_* and SEEK_END constants
use Fcntl qw(:flock SEEK_END);
sub lock {
    my ($fh) = @_;
    flock($fh, LOCK_EX) or die "Cannot lock mailbox - $!\n";
    # and, in case someone appended while we were waiting...
    seek($fh, 0, SEEK_END) or die "Cannot seek - $!\n";
}
sub unlock {
    my ($fh) = @_;
    flock($fh, LOCK_UN) or die "Cannot unlock mailbox - $!\n";
}
open(my $mbox, "+>>", "/home/domains/WORK/Perl/flock/mamuli.$ENV{'USER'}")

    or die "Can't open mailbox: $!";
lock($mbox);
print $mbox $msg;
unlock($mbox);
