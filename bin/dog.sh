#!/usr/bin/env bash

# Description: An alternative to cat command
# Author: Maros Kukan

# Compound command to process EOF line
while read -r || [[ $REPLY ]]; do
    printf "%s\n" "$REPLY"
done <"$1"