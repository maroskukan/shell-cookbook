#!/usr/bin/env bash

# Create a report file for a single shipping container
# Author: Maros Kukan

# Read arguments from arguments
containerId="$1"
folder="$2"

if [ ! -d "$folder" ]; then mkdir -p -- "$folder"; fi

grep -- "$containerId" shipments.csv > "$folder/$containerId.csv"

records=$(wc -l "$folder/$containerId.csv" | cut -d' ' -f1)

printf "Report %s/%s created with %s records.\n" $folder $containerId $records