#!/usr/bin/env bash

# Description: Simple demostration of read with options
# Author: Maros Kukan

echo -n "Are you sure (Y/N)? "

declare answered

while [[ ! $answered ]]; do
    read -r -n 1 -s answer
    if [[ $answer = [Yy] ]]; then
        answered="yes"
    elif [[ $answer = [Nn] ]]; then
        answered="no"
    fi
done

printf "\n%s\n" $answered