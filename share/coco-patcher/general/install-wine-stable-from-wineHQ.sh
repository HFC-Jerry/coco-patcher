#!/bin/bash

# Add 32-bit architecture
sudo dpkg --add-architecture i386

# Install wget
sudo apt-get install -y wget

# Update repositories
sudo apt update

# Add WineHQ key
wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -

# Add WineHQ repository
sudo apt-add-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"

# Update repositories again after adding Wine repo
sudo apt update

# Install Wine Stable
sudo apt-get install --install-recommends -y winehq-stable

# Run wineconsole briefly to initialize
timeout 5s wineconsole

echo "Wine Stable installed successfully."
read -p "Press any key to Quit..." -n 1
echo
