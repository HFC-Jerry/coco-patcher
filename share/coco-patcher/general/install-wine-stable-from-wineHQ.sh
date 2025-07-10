#!/bin/bash
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt update

# Optional: purge old Wine versions if you run into dependency issues
# sudo apt-get purge 'wine*' 'wine*:i386'
# sudo apt autoremove
# sudo apt update

sudo apt install --install-recommends winehq-stable -y

wine --version && echo "Wine installed successfully!" || echo "Something went wrong :("

echo "Press any key to quit"
read -n 1

