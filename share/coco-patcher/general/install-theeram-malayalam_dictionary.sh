#!/bin/bash

# Install the required packages with root permission
pkexec apt-get install -y theeram theeram-package-olam

# Wait for user input to quit
read -p "Press any key to Quit..." -n 1
echo
