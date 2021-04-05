#!/usr/bin/env bash

# Description: Demostrates the use of standard streams (input, output, error)
# Author: Maros Kukan

# Input redirection
grep orange < shoppinglist.txt

# Output redirection
ls > listing.txt
ls >> listing.txt

# Pipes
ls / | grep bin

# Redirect a specific stream with N>. In this example error stream(2) is redirected to /dev/null
cmd 2> /dev/null

# Redirect to a specific stream with >&N
>&2 sends output to stderr # same as 1>&2

# Seonding both error and output to single file
cmd > logfile 2>&1 # cmd > logile 2> logfile would overwrite the logfile



