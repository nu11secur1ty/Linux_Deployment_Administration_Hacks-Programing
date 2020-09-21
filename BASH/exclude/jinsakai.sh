#!/usr/bin/bash
######################################
# Create Backup every night in 00:00 #
#      by V.Varbanovski              #
######################################

# youruser spec
cd /home/youruser/dir/
tar -czf "$(date +'%Y-%m-%d')your_archive.tar.gz" --exclude=yourdir htdocs/
        sleep 1
        mv *your_archive.tar.gz* /home/youruser/.backup/htdocs.backup
