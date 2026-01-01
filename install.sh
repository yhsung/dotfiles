#!/bin/bash
# This script runs inside the container
sudo apt-get update && sudo apt-get install -y gnupg2

# Configure Git to use the forwarded agent
git config --global commit.gpgsign true
git config --global user.signingkey 2D788AC58758D448
