#!/usr/bin/env bash

# Demostrates usage of classic test, [ and [[ (bash extension) 
# Author: Maros Kukan


# Test if /etc is a file - returns false (code 1)
test -f /etc; echo $?

# Alternative way for testing - returns false (code 1)
[ -f /etc ]; echo $?

# Bash extension, shell keyword, recommended way - returns false (code 1)
[[ -f /etc ]]; echo $?

# Test if /etc is a director - returns true (code 0)
test -d /etc; echo $?

# Test if exist (-e) - returns false (code 1) if directory or file does not exist
test -e dir1 || mkdir dir1

# Test if user has write (-w) permission. if yes, create a file in that folder
test -w dir1 && touch dir1/file1; ls -l dir1/ 

# Test if number of arguments is 1 and the value is set to foo
[[ $# -eq 1 && $1 = "foo"]]

