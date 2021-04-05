#!/usr/bin/env bash

# Retrieves information about Bash
# Author: Maros Kukan

# Retrieve bash version - long output
bash --version

# Retrieve bash version - short output
echo $BASH_VERSION

# Check if update is avilable
sudo apt search ^bash$


