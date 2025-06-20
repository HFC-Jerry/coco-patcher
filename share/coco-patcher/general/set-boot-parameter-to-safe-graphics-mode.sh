#!/bin/bash

# Modify GRUB to add 'nomodeset'
pkexec sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset"/g' /etc/default/grub

# Update GRUB configuration
pkexec update-grub

# Wait for user key press to exit
read -p "Press any key to Quit..." -n 1
echo
