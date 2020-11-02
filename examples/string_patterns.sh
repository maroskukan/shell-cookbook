#!/usr/bin/env bash

# Description: Demostrates the use of pattern matching
# Author: Maros Kukan

f="/Users/maros/notes.txt"

# Removes leading /
f1=${f#*/}

# Keeps only file name
f2=${f##*/}

# Removes file extension
f3=${f%.*}

