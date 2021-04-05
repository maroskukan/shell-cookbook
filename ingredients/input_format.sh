#!/usr/bin/env bash

# Demostrates the use of shell builtin read
# Author: Maros Kukan

# Reads user input and prints it back to terminal
read; echo $REPLY

# To be able to input special characters like escape sequences to be stored in variable
read -r; echo $REPLY

# Reading multiple words
read a b
echo $a $b

# Input Field Separator (IFS) variable dictates how read denotes the end of word
IFS=: read a b # type hello:world
echo $a $b

