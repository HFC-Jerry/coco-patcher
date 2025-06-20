#!/bin/bash

# Install dependencies
pkexec apt-get install -y git debhelper-compat dh-python gnome-pkg-tools gettext libatk1.0-dev libatk-bridge2.0-dev libatspi2.0-dev libgstreamer1.0-dev pkg-config python3 python-gi-dev python3-brlapi python3-louis liblouis-dev python3-pyatspi python3-speechd yelp-tools meson python3-dasbus cmake itstool python3-psutil

# Check if installation was successful
if [ $? -ne 0 ]; then
    echo "Unable to install build dependencies. Press any key to Quit"
    read -n 1
    exit
fi

# Clone Orca repository
cd /tmp
rm -rf /tmp/orca
git clone --depth 1 https://github.com/GNOME/orca.git

# Check if clone was successful
if [[ ! -d orca ]]; then 
    echo "Unable to clone latest orca. Press any key to Quit"
    read -n 1
    exit
fi

# Build Orca (no root required)
cd /tmp/orca/
meson setup _build
if [ $? -ne 0 ]; then
    echo "Meson setup failed. Press any key to Quit"
    read -n 1
    exit
fi

meson compile -C _build
if [ $? -ne 0 ]; then
    echo "Meson compile failed. Press any key to Quit"
    read -n 1
    exit
fi

# Install Orca (requires root)
sudo meson install -C _build
if [ $? -ne 0 ]; then
    echo "Meson install failed. Press any key to Quit"
    read -n 1
    exit
fi

echo "Orca has been installed successfully. Press any key to Quit"
read -n 1
