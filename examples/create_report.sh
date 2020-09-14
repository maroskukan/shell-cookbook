#!/usr/bin/env bash

# Create a report file for a single shipping container
# Author: Maros Kukan

# Verify number of arguments
if [ "$#" -ne 2 ]; then
  printf "Usage: %s CONTAINER-ID OUTPUT-FOLDER\n" "$0"
  exit 1
fi

# Read arguments from arguments
containerId="$1"
folder="$2"

if [ ! -d "$folder" ]; then mkdir -p -- "$folder"; fi

grep -- "$containerId" shipments.csv > "$folder/${containerId}_report.csv"

records=$(wc -l "$folder/${containerId}_report.csv" | cut -d' ' -f1)

printf "Report %s/%s created with %s records.\n" "$folder" "$containerId" "$records"