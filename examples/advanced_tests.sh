#!/usr/bin/env bash

# Demostrates usage of advanced tests conditions
# Author: Maros Kukan

# Test if /etc is a file - returns false (code 1)
test -f /etc; echo $?

# Test if /etc is a director - returns true (code 0)
test -d /etc; echo $?

# Test if exist (-e) - returns false (code 1) if directory or file does not exist
test -e dir1 || mkdir dir1

# Test if user has write (-w) permission. if yes, create a file in that folder
test -w dir1 && touch dir1/file1; ls -l dir1/ 

