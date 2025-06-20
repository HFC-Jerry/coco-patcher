#!/bin/bash
set -e  # Exit on any error

# Ensure wget is installed
pkexec apt-get install -y wget

cd /tmp || exit 1

# Add the GPG key
if [[ ! -f anydesk.gpg ]]; then
    wget -O anydesk.gpg https://keys.anydesk.com/repos/DEB-GPG-KEY
    if [ $? -ne 0 ]; then
        rm -f anydesk.gpg
        echo "Unable to download AnyDesk GPG key. Press any key to Quit."
        read -n 1
        exit 1
    fi
fi

# Install the GPG key to system keyring
pkexec bash -c 'gpg --dearmor -o /usr/share/keyrings/anydesk.gpg /tmp/anydesk.gpg'

# Add the AnyDesk repository
echo "deb [signed-by=/usr/share/keyrings/anydesk.gpg] http://deb.anydesk.com/ all main" | pkexec tee /etc/apt/sources.list.d/anydesk-stable.list

# Update repositories and install AnyDesk
pkexec apt update
pkexec apt install -y anydesk

echo "AnyDesk installation complete. Press any key to Quit."
read -n 1
