#!/bin/bash
sudo add-apt-repository ppa:linvinus/rhvoice
sudo apt-get install rhvoice speech-dispatcher-rhvoice rhvoice-english
sudo sed -i 's/#AddModule "rhvoice"/AddModule "rhvoice"/' /etc/speech-dispatcher/speechd.conf
