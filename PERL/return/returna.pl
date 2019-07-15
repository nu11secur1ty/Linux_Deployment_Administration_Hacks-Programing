#!/usr/bin/perl 
use strict;
use warnings;
use diagnostics;

# Subroutine for Multiplication 
sub Mul($$)  
{
    my($a, $b ) = @_;
    my $c = $a * $b;

    # Return Value     
    return($a, $b, $c);
}

# Calling in Scalar context 
 my $retval = Mul(25, 10);
print ("Return value is $retval\n" );

# Calling in list context 
my @retval = Mul(25, 10);
print ("Return value is @retval\n" );
