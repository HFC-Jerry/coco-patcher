#!/bin/bash

# Install Snap Store using root permissions
pkexec snap install snap-store

# Wait for user input to exit
read -p "Press any key to Quit..." -n 1
echo
