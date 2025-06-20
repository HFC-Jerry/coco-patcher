#!/bin/bash

# Run everything as root using pkexec
pkexec bash << 'EOF'

# Clean previous temp folder
rm -rf /tmp/vscode/
mkdir -p /tmp/vscode
cd /tmp/vscode

# Remove existing VS Code (if installed)
apt-get -y remove code

# Install required tools
apt-get -y install wget gpg

# Download Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/

# Add VS Code repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

# Update and install VS Code
apt-get update
apt-get -y install code || { echo "VS Code installation failed. Exiting."; exit 1; }

# Clean up
rm -f microsoft.gpg
rm -rf /tmp/vscode/


EOF
echo "VS Code installation completed! Press any key to Quit"
read -n 1
