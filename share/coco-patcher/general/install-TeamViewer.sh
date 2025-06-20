#!/bin/bash

# Install wget if not present
pkexec apt-get install -y wget

cd /tmp || exit 1

# Download TeamViewer if not already present
if [[ ! -f teamviewer_amd64.deb ]]; then 
    wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
    if [ $? -ne 0 ]; then
        rm -f teamviewer_amd64.deb
        echo "Unable to download latest TeamViewer. Press any key to Quit."
        read -n 1
        exit 1
    fi
fi

# Install gdebi if not present (recommended)
pkexec apt-get install -y gdebi-core

# Install TeamViewer using gdebi
pkexec gdebi /tmp/teamviewer_amd64.deb -n

echo "TeamViewer installation complete. Press any key to Quit."
read -n 1
