#!/bin/bash

# Try to remove ippusbxd, continue even if not installed
sudo apt remove -y ippusbxd || true

# Ask user to replug the scanner
read -p "Replug the scanner and scan. Press any key to Quit..." -n 1
echo
