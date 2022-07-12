#!/bin/bash
the_ppa=ppa.launchpad.net/nandakumar96/testing
if ! grep -q "^deb .*$the_ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding ppa.launchpad.net/nandakumar96/testing"
    pkexec add-apt-repository ppa:nandakumar96/testing -y
fi

pkexec apt-get install -y theeram theeram-package-olam
echo "Press any key to Quit"
read -n 1
