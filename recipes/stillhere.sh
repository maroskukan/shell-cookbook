#!/usr/bin/env bash

# Description: Demostrates script backgrounding
# Author: Maros Kukan

# ./stillhere.sh -l &
# tail -f logfile

# Exec is used for global redirection
if [[ $1 == "-l" ]]; then
    exec >logfile
fi

declare -i i=0
while true; do
    echo "still here $((++i))"
    sleep 1
done

