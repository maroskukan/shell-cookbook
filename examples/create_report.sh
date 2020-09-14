#!/usr/bin/env bash

# Create a report file for a single shipping container
# Author: Maros Kukan

# Verify number of arguments
if [ "$#" -ne 3 ]; then
  printf "Usage: %s RECORDS CONTAINER-ID OUTPUT-FOLDER\n" "$0"
  exit 1
fi


# Store values from arguments
records="$1"
containerId="$2"
folder="$3"


# Check if folder already exists
if [ ! -d "$folder" ]; then mkdir -p -- "$folder"; fi


# Filters the source file
if grep -- "$containerId" "$records" > "$folder/${containerId}_report.csv"
then
    records=$(wc -l "$folder/${containerId}_report.csv" | cut -d' ' -f1)
    printf "Report %s/%s_report.csv created with %s records.\n" "$folder" "$containerId" "$records"
    exit 0
else
    printf "Container id %s was not found in %s\n" "$containerId" "$records"
    exit 1
fi

