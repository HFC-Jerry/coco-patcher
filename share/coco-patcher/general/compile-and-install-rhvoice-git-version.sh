#!/bin/bash

# Clean and prepare temp directory with root
sudo rm -rf /tmp/rhvoice/

cd /tmp || exit 1

# Remove old RHVoice if present
sudo apt-get -y remove librhvoicecore || true

# Install build dependencies
pkexec apt-get -y install scons libpulse-dev libao-dev portaudio19-dev libspeechd-dev gnulib

# Clone RHVoice repository
git clone --recursive https://github.com/rhvoice/rhvoice

cd rhvoice || exit 1

# Build the source
scons

# Install RHVoice with root permissions
pkexec bash -c "cd /tmp/rhvoice && scons install"

# Refresh shared libraries
pkexec ldconfig

# Create symlink for speech dispatcher module
pkexec ln -f -s /usr/local/bin/sd_rhvoice /usr/lib/speech-dispatcher-modules

# Cleanup
pkexec rm -rf /tmp/rhvoice/

echo "Installation completed! Press any key to Quit"
read -n 1
