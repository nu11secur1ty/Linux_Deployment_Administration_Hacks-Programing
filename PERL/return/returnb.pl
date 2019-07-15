#!/usr/bin/perl 
use strict;
use warnings;
use diagnostics;
  
# Subroutine for Subtraction 
sub Sub($$)  
{ 
    my($a, $b ) = @_;  
      
    my $c = $a - $b; 
      
    # Return Value     
    return($a, $b, $c); 
} 
  
# Calling in Scalar context 
my $retval = Sub(25, 10); 
print ("Return value is $retval\n" ); 
  
# Calling in list context 
my @retval = Sub(25, 10); 
print ("Return value is @retval\n" );
