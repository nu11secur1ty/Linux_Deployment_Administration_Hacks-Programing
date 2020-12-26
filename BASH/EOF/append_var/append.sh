#!/usr/bin/bash
cat > 2021.pl << 'EOF'
my $welcome = `ls -al ~/*`;
print $welcome;
EOF
