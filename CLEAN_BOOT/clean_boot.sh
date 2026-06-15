#!/bin/bash
# Author Dick Fucker
# Check if the script is running with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root (sudo)."
  exit
fi

echo "--- Starting cleanup of /boot ---"

# 1. Remove configuration files for already uninstalled kernels
echo "Removing residual configuration files..."
apt purge $(dpkg --list | grep '^rc' | awk '{print $2}') -y

# 2. Automatically remove unnecessary packages and old kernels
echo "Running apt autoremove..."
apt autoremove --purge -y

# 3. Update the GRUB boot menu
echo "Updating GRUB..."
update-grub

# 4. Clean the apt cache
echo "Cleaning apt cache..."
apt clean

echo "--- Cleanup completed successfully! ---"
df -h /boot | grep /boot
