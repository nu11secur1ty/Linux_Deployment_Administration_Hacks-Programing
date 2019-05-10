#!/bin/bash
######################################
# Create Backup every night in 00:30 #
# author nu11secur1ty                #
######################################

# Dump mysql bases.
mysqldump -u root -pyour_password --opt --all-databases | gzip > ~/your/path/$(date "+%Y-%m-%d").sql.gz

# What to backup. 
backup_files="/var/lib/mysql/";

# Where to backup to.
dest="/your/path";

# Create archive filename.
day=$(date +'%Y-%m-%d');
hostname=$(hostnamectl);
archive_file="$hostnamectli_$day.tgz";

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file";
      date >> /your/path/$day;
echo

# Backup the files using tar.
tar -czf $dest/$archive_file $backup_files;

# Print end status message.
echo
echo "Backup finished";
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest;
exit 0;
