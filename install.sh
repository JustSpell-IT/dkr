#!/bin/bash

# Check if curl is installed
if ! command -v curl &> /dev/null
then
    echo "curl could not be found. Please install curl and try again."
    exit
fi

# Download the dkr script
curl -fsSL https://raw.githubusercontent.com/tulik/dkr/main/dkr.sh -o dkr

# Check if the download was successful
if [ $? -ne 0 ]
then
    echo "Failed to download dkr script. Please check your internet connection and try again."
    exit
fi

# Make the dkr script executable
chmod +x dkr

# Move the dkr script to /usr/local/bin or another directory in PATH
sudo mv dkr /usr/local/bin/

# Check if the move was successful
if [ $? -eq 0 ]
then
    echo "dkr script installed successfully. You can use it by typing 'dkr' in your terminal."
else
    echo "Failed to install dkr script. Please check your permissions and try again."
fi
