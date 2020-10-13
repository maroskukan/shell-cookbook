#!/usr/bin/env bash

# Description: An alternative to cat command
# Author: Maros Kukan

while read -r || [[ $REPLY ]]; do
    printf "%s\n" "$REPLY"
done <"$1"