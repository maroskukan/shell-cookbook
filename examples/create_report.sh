#!/usr/bin/env bash

# Create a report file for a single shipping container
# Author: Maros Kukan

# Check source file 
if [[ ! $1 ]]; then
    printf "Error: Input file not configured\n"
    printf "Usage: %s INPUT-FILE CONTAINER-ID <OUTPUT-FOLDER>\n" "$0"
    exit 1
else
    # Check if source file exists
    if [[ ! -e "$1" ]]; then
         printf "Error: Input file %s does not exists\n" "$1"
         exit 1
    else
         input_file="$1"
    fi
fi


if [[ ! $2 ]]; then
    printf "Error: Container id not specified\n"
    printf "Usage: %s INPUT-FILE CONTAINER-ID <OUTPUT-FOLDER>\n" "$0"
    exit 1
else    
    containerId="$2"
fi


# Check if output folder was provided
if [[ ! $3 ]]; then
    folder="reports"
else
    folder="$3"
fi

# Check if folder already exists if not create it
if [ ! -d "$folder" ]; then mkdir -p -- "$folder"; fi


# Filters the source file
if grep -- "$containerId" "$input_file" > "$folder/${containerId}_report.csv"
then
    records=$(wc -l "$folder/${containerId}_report.csv" | cut -d' ' -f1)
    printf "Success: Report %s/%s_report.csv created with %s records.\n" "$folder" "$containerId" "$records"
    exit 0
else
    printf "Error: Container id %s was not found in %s\n" "$containerId" "$input_file"
    exit 1
fi

