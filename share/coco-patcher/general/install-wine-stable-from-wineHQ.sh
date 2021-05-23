#!/bin/bash
sudo dpkg --add-architecture i386
sudo apt update
wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo apt-add-repository 'deb http://dl.winehq.org/wine-builds/ubuntu/ bionic main'
sudo apt-get install --install-recommends winehq-stable
echo "Press any key to Quit"
read -n 1
