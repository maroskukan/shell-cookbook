#!/usr/bin/env bash

# Create a report file for a single shipping container
# Author: Maros Kukan

folder="reports"
containerId=$1

if [ ! -d $folder ]; then mkdir $folder; fi

grep $containerId shipments.csv > $folder/$containerId.csv

records=$(wc -l $folder/$containerId.csv | cut -d' ' -f1)

echo "Report created with $records records."
