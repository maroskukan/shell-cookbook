#!/usr/bin/env bash

# Description: Changes filename extension
# Author: Maros Kukan


[[ $# -ne 2 ]] && { echo "Two arguments required, example: $0 txt zip" >&2; exit 1; }

# Version 1.0
# for file in *"$1"; do # *"$1" is a wildcard matching all files with given extension
#     base=$(basename "$file" "$1")
#     echo "$file > ${base}$2"
#     mv "$file" "${base}$2" 
# done

# Version 1.1
for file in *"$1"; do
    echo "$file > ${file/%$1/$2}"
    mv "$file" "${file/%$1/$2}"
done
exit 0

