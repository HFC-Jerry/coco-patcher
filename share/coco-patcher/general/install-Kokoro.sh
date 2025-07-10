#!/bin/bash

set -e

echo "🔧 Starting TTS Engine setup..."


WORKDIR=$(mktemp -d)
cd "$WORKDIR"

echo "📥 Cloning TTS essentials repo..."
git clone https://github.com/HFC-Jerry/TTS-Engine-essentials.git
cd TTS-Engine-essentials
git switch Jammy

echo "🚀 Running daemon setup..."
chmod +x setup_kokoro.sh
./setup_kokoro.sh

echo "🛠️ Installing speech-dispatcher configuration..."
sudo cp speechd.conf /etc/speech-dispatcher/speechd.conf

echo "📦 Placing custom Python module..."
sudo cp my_custom.py /usr/local/bin/my_custom.py
sudo chmod +x /usr/local/bin/my_custom.py

echo "📁 Copying module configuration..."
sudo cp kokoro.conf /etc/speech-dispatcher/modules/kokoro.conf

echo "🔄 Restarting speech-dispatcher..."
if sudo systemctl restart speech-dispatcher; then
  echo "✅ speech-dispatcher restarted successfully with systemctl"
elif sudo service speech-dispatcher restart; then
  echo "✅ speech-dispatcher restarted successfully with service"
else
  echo "⚠️ Could not restart speech-dispatcher automatically. Please restart your machine manually."
fi
echo "TTS-Engine is now installed.Press any key to quit"
read -n 1

