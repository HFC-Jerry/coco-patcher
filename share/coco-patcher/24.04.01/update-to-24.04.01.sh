#!/bin/bash

pkexec apt-mark hold plymouth-theme-ubuntu-mate-text plymouth-theme-ubuntu-mate-logo gnome-session-canberra firefox* libreoffice* plymouth plymouth-label plymouth-theme-spinner plymouth-theme-ubuntu-text ubiquity-slideshow-ubuntu-mate

pkexec apt-get upgrade -y

if [ $? -ne 0 ]; then
    echo "Unable to update packages. Press any key to Quit"
    read -n 1
    exit
fi

pkexec apt-mark unhold plymouth-theme-ubuntu-mate-text plymouth-theme-ubuntu-mate-logo gnome-session-canberra firefox* libreoffice* plymouth plymouth-label plymouth-theme-spinner plymouth-theme-ubuntu-text ubiquity-slideshow-ubuntu-mate

pkexec apt-get clean

pkexec apt-get install uget

if [ $? -ne 0 ]; then
    echo "Unable to install uGet. Press any key to Quit"
    read -n 1
    exit
fi

### Chrome unnecessary password on start removed. ###
pkexec sed -i '/Exec/c\Exec=/usr/bin/chromium --force-renderer-accessibility --password-store=basic %U ' /usr/share/applications/chromium.desktop

### Open documents in User-Guide directly ###
pkexec chmod -x /etc/skel/Desktop/User\ Guide/*.text
chmod -x ~/Desktop/User\ Guide/*.text

if [ $? -ne 0 ]; then
    echo "Unable to run necessary commmands. Press any key to Quit"
    read -n 1
    exit
fi

pkexec sed -i '/Version Accessible-Coconut-24.04-beta/c\Version Accessible-Coconut-20.04.01' /usr/share/Coconut/customization_details.text
echo "System updated to 24.04.01. Press any key to quit."
read -n 1
