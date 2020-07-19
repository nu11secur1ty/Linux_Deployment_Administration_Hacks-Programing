#!/usr/bin/perl
# author V.Varbanovski @nu11secur1ty
use strict;
use warnings;
use diagnostics;
# All folders
# Cleaning all folders in array
our @folders = ('folder/*', 'folder2/*', 'folder3/*', 'folder4/*', 'folder5/*',
             'folder6/*', 'folder7/*', 'folder8/*', 'folder9/*',
             'folder10/*', 'folder11/*', 'folder12/*', 'folder13/*',
             'folder14/*', 'folder15/*', 'folder16/*', 'folder17/*', 'folder18/*',
             'folder19/*', 'folder20/*', 'folder20/*', 'folder21/*',
             'folder22/*', 'folder23/*');

foreach (@folders) {
        our $check_folders_clean = `rm -rf $_`;
}
        print "Cleaning is finished\n";
exit 0;
