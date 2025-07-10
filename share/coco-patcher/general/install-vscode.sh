#!/bin/bash
cd /tmp
if [[ -f code_amd64.deb ]]; then 
    rm code_amd64.deb
fi

wget -O code_amd64.deb "https://update.code.visualstudio.com/latest/linux-deb-x64/stable"
if [ $? -ne 0 ]; then
    rm -f code_amd64.deb
    echo "Unable to download latest VS Code. Press any key to Quit"
    read -n 1
    exit
fi

pkexec gdebi /tmp/code_amd64.deb -n
echo "Press any key to Quit"
read -n 1
