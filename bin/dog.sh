#!/usr/bin/env bash

# Description: An alternative to cat command
# Author: Maros Kukan

while read -r; do
    printf "%s\n" "$REPLY"
done <"$1"