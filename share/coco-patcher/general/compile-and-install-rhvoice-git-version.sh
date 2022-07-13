rm -rf /tmp/rhvoice/
cd /tmp
pkexec apt-get -y remove librhvoicecore
pkexec apt-get -y install scons libpulse-dev libao-dev portaudio19-dev libspeechd-dev gnulib
git clone --recursive https://github.com/rhvoice/rhvoice
cd rhvoice
scons
pkexec bash -c "cd /tmp/rhvoice; scons install"
pkexec ldconfig
pkexec ln -f -s /usr/local/bin/sd_rhvoice /usr/lib/speech-dispatcher-modules
rm -rf /tmp/rhvoice/
echo "Installation completed! Press any key to Quit"
read -n 1
