#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

my(%weekday, $key, $value);
   # The each function retrieves both keys and values from a hash
   %weekday=(
      'Mon' => 'Monday',
      'Tue' => 'Tuesday',
      'Wed' => 'Wednesday',
      'Thu' => 'Thursday',
      'Fri' => 'Friday',
      'Sat' => 'Saturday',
      'Sun' => 'Sunday',
   );
        while(($key,$value)=each(%weekday)){
        print "$key = $value\n";
   }
