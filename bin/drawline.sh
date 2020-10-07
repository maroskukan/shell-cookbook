#!/usr/bin/env bash

# Description: Prints a line of characters
# Author: Maros Kukan

if [[ ! $1 ]]; then
    echo "Need line lenght argument" >&2
    exit 1
fi

if [[ $1 =~ ^[0-9]+$ ]]; then
    declare length="$1"
else
    echo "Length has to be a number" >&2
    exit 1
fi

declare char="="
if [[ $2 ]]; then
    char="$2"
fi

declare line
for (( i=0; i<length; i++ )); do
    line="${line}${char}"
done

printf "$line\n"
exit 0
