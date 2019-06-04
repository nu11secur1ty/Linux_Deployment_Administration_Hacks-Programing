# Create a file for testing:
```bash
fallocate -l 100M file.out
```

# Using the script to resize the log file
```perl
#!/usr/bin/perl 
# author V.Varbanovski @nu11secur1ty
use strict;
use warnings;
use diagnostics;

my $file = "/your/path/to/file.out";

# Your size limit of your file
my $size = '10MB';

# Checking for current size of your log file
my $check_file_size = `du -sh $file`;

# Executing operation for resizing of your log file
	if($check_file_size lt $size){
		my $truncate = `truncate -s $size $file`;
		}
my $last_check = `du -sh $file`;
  print "$last_check\n";
exit 0;
```
