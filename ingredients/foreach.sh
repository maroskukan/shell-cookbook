#!/usr/bin/env zsh

# Demostrates usage of foreach in zsh
# Author: Maros Kukan

# List all files in current directory
foreach f (*) echo $f; end