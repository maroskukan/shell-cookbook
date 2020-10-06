#!/usr/bin/env bash

# Description: Changes filename extension
# Author: Maros Kukan

if [[ $# -ne 2 ]]; then
    echo "Two arguments required, example below"
    echo "$0 txt zip"
    exit 1
fi

for file in *"$1"; do # *"$1" is a wildcard matching all files with given extension
    base=$(basename "$file" "$1")
    echo "$file > ${base}$2"
    mv "$file" "${base}$2" 
done
exit 0
