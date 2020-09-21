#!/usr/bin/env bash

# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing Designer applications"

# Graphic editing tools

brew cask install sketch
brew cask install monodraw

# Font syncing tools

brew cask install skyfonts

# Install Mac App Store Apps

mas install 1289583905 # Pixelmator Pro

set -e
