#!/bin/sh

# Start up script to check if all requried dependencies are installed

# check if node_modules exists
if [ -d "./node_modules" ]; then
    echo "Dependencies already installed"
else
    echo "Installing dependencies"
    npm install
fi
