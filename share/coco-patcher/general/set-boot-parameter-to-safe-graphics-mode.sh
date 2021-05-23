#!/bin/bash
pkexec sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset"/g' /etc/default/grub
pkexec update-grub
echo "Press any key to Quit"
read -n 1
