#!/usr/bin/env bash

# Description: Prints number of and content of provided arguments
# Author: Maros Kukan

echo "You entered $# arguments"

for arg in "$@"; do
    echo $arg;
done