#!/bin/bash
cd /tmp
rm -f /tmp/skypeforlinux-64.deb
wget https://repo.skype.com/latest/skypeforlinux-64.deb

if [[ ! -e skypeforlinux-64.deb ]];
then 
    echo "Unable to download latest skype for linux. Press any key to Quit"
    read -n 1
    exit
fi

pkexec gdebi --n /tmp/skypeforlinux-64.deb

if [ $? -ne 0 ]; then
    echo "Unable to install skype. Press any key to Quit"
    read -n 1
    exit
fi

echo "Press any key to Quit"
read -n 1
