#!/usr/bin/env bash

# Simple note-taking script
# Author: Maros Kukan

# Enable debug
#set -x

declare date=$(date +%Y-%m-%d)
declare topic="$1"
declare filename="${HOME}/${topic}notes.txt"
declare note

# Ask user for input
read -r -p "Please enter your note: " note

# Disable debug
#set +x

if [[ $note ]]; then
    # Prints date and retrieves all arguments and writes to file 
    echo "${date}: $note" >> "$filename"
    echo "Note '$note' saved to $filename"
    exit 0
else
    echo "No input; note was't saved." 1>&2
    exit 1
fi
