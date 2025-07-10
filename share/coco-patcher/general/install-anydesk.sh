#!/bin/bash

cd /tmp

if [[ -f anydesk_7.0.1-1_amd64.deb ]]; then 
    rm anydesk_7.0.1-1_amd64.deb
fi

wget -O anydesk_7.0.1-1_amd64.deb "https://download.anydesk.com/linux/anydesk_7.0.1-1_amd64.deb"
if [ $? -ne 0 ]; then
    rm -f anydesk_7.0.1-1_amd64.deb
    echo "Unable to download AnyDesk. Press any key to Quit"
    read -n 1
    exit
fi

pkexec gdebi /tmp/anydesk_7.0.1-1_amd64.deb -n
echo "Press any key to Quit"
read -n 1

