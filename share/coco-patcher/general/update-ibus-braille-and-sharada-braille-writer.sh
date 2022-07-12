#!/bin/bash

the_ppa=ppa.launchpad.net/nalin-x-linux/libbraille-input
if ! grep -q "^deb .*$the_ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding ppa.launchpad.net/nalin-x-linux/libbraille-input"
    pkexec add-apt-repository ppa:nalin-x-linux/libbraille-input -y
fi

the_ppa=ppa.launchpad.net/nalin-x-linux/sbw
if ! grep -q "^deb .*$the_ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding ppa.launchpad.net/nalin-x-linux/sbw"
    pkexec add-apt-repository ppa:nalin-x-linux/sbw -y
fi

the_ppa=ppa.launchpad.net/nalin-x-linux/ibus-braille
if ! grep -q "^deb .*$the_ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding ppa.launchpad.net/nalin-x-linux/ibus-braille"
    pkexec add-apt-repository ppa:nalin-x-linux/ibus-braille -y
fi

pkexec apt-get install -y libbraille-input sharada-braille-writer ibus-braille

# updating ibus-braille shortcut launcher
pkexec cp /usr/bin/ibus-braille-launcher /usr/share/Coconut/ibus-braille-start.sh

echo "Press any key to Quit"
read -n 1
