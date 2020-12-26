#!/usr/bin/bash
cat > 2021.pl << 'EOF'
#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

my $welcome = `ls -all ~/*`;
print $welcome;
EOF
