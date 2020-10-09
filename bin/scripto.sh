#!/usr/bin/env bash

# Description: Searches for string in a file and then prints the remaining portion
# Author: Maros Kukan

if [[ ! $1 ]]; then
    echo "Usage: $0 <string> < <filename>" >&2
    echo "Example: $0 body < webpage.html" >&2
    exit 1
fi

declare found

# Read up to first match
while read -r; do
    if [[ ! $found ]]; then
        if [[ $REPLY =~ $1 ]]; then
            found="true"
        else
            continue
        fi
    fi
    echo "$REPLY"
done

exit 0