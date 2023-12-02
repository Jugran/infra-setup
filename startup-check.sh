#!/bin/sh

# Start up script to check if all requried dependencies are installed

installDeps() {
    echo "Checking dir: $1"
    cd ./$1
    # check if node_modules exists
    if [ -d "./node_modules" ]; then
        echo "$1 dependencies already installed"
    else
        echo "Installing $1 dependencies"
        npm install
    fi

    cd ../
}

installDeps orders
installDeps products
installDeps user
