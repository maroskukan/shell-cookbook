#!/usr/bin/env bash

# Create a report file for a single shipping container
# Author: Maros Kukan

if [ ! -d "reports" ]; then mkdir reports; fi

grep H6 shipments.csv > reports/H6.csv

echo "Report created."
