#!/bin/bash

echo "this script installs everything required to setup the application for local development"
echo "checking whether .venv folder already present or not"

if [ -d ".venv" ];
then 
    echo ".venv folder already present in the app, Installing the packages using pip"
else 
    echo "initializing the local virtual environment and then installing packages using pip"
    pip install virtualenv;
    python3 -m virtualenv .venv;
fi

if [[ "$OSTYPE" == "msys" ]]; then
    . .venv/Scripts/activate
else
    . .venv/bin/activate
fi

pip install --upgrade pip
echo "upgraded pip"

pip install -r requirements.txt
echo "installed packages"

deactivate
