#!/usr/bin/env bash

# Demostrates the usage of arithmentic tests
# Author: Maros Kukan

# Arithmetic tests Operators
# -eq: equality 
# -ne: not equal
# -lt: less than
# -gt: greater than

# checks the number of arguments


# Two arguments required and Both arguments should be directories
if [[ $# -ne 2 ]]; then
    echo "Enter two arguments"
    exit 1
else
    for arg in "$@"
    do
        if [[ ! -d $arg ]]; then
            echo "'$arg' is not a directory"
            exit 1
        fi
    done
fi

declare dir1="$1"
declare dir2="$2"

# Get number of files in directories
declare count_1=$(ls -Al "$dir1" | wc -l)
declare count_2=$(ls -Al "$dir2" | wc -l)

# Which one has most files?
if [[ $count_1 -gt $count_2 ]]; then
    echo "$dir1 has more files than $dir2"
    exit 0
elif [[ $count_1 -lt $count_2 ]]; then
    echo "$dir1 has less files than $dir2"
    exit 0
else
    echo "$dir1 has same amount of files than $dir2"
    exit 0
fi
