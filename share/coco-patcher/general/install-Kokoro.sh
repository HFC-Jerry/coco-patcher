#!/bin/bash
set -e

# 1. Install system dependencies
echo "Installing dependencies..."
pkexec apt-get update
pkexec apt-get install -y git python3 python3-venv python3-pip espeak-ng docker.io docker-compose

# 2. Optional: Start Docker
echo "Ensuring Docker is running..."
pkexec systemctl start docker

# 3. Clone Kokoro-FastAPI (stable branch)
cd /tmp
rm -rf Kokoro-FastAPI
git clone https://github.com/remsky/Kokoro-FastAPI.git
cd Kokoro-FastAPI
git checkout stable

# 4. Build and start service with Docker Compose (CPU)
echo "Starting Kokoro TTS service..."
pkexec docker-compose -f docker-compose.cpu.yml up --build -d

# 5. Show status and access info
echo -e "\n✅ Kokoro TTS service is running!"
echo "Access API at http://localhost:8880"
echo "Docs/UI (if available) at http://localhost:8888/web (or 7860)"
echo

# 6. (Optional) Clone CLI wrapper for direct use
git clone https://github.com/cheuerde/kokoro-tts-cli.git /tmp/kokoro-cli
cd /tmp/kokoro-cli
pip install . --user

echo -e "\nUsage examples:"
echo "  echo 'Hello world' | kokoro-tts --voice af_bella --speed 1.0"
echo "  kokoro-tts-server &  # start background server"
echo "  echo 'Test' | kokoro-tts-client --voice bf_emma"

echo -e "\nDone! Press any key to exit."
read -n 1
