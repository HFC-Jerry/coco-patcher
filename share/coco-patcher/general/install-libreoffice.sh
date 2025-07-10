#!/bin/bash
set -e  # Exit on any error
cd /tmp

echo "Removing old LibreOffice (including 7.x)..."
pkexec apt-get remove --purge -y libreoffice* libreoffice7.* libreoffice-core libreoffice-common || true
pkexec apt-get autoremove -y
pkexec apt-get autoclean

echo "Old LibreOffice removed successfully."

# Clean up any existing tar.gz file
if [[ -f LibreOffice_25.2.4_Linux_x86-64_deb.tar.gz ]]; then
    rm -f LibreOffice_25.2.4_Linux_x86-64_deb.tar.gz
fi

echo "Downloading LibreOffice 25.2.4..."
wget "https://mirrors.aliyun.com/tdf/libreoffice/stable/25.2.4/deb/x86_64/LibreOffice_25.2.4_Linux_x86-64_deb.tar.gz"
echo "Download complete."

echo "Extracting..."
tar -xvzf LibreOffice_25.2.4_Linux_x86-64_deb.tar.gz

cd LibreOffice_25.2.4.*/DEBS || exit 1
ls

echo "Installing LibreOffice 25.2.4..."
sudo dpkg -i *.deb

echo "LibreOffice 25.2.4 installed successfully. Press any key to Quit"
read -n 1
