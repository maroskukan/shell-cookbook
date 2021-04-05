#!/usr/bin/env bash

# Description: Creates box around text
# Author: Maros Kukan

# Box function definition
drawline () {
    declare line=""
    declare char="-"
    for (( i=0; i<$1; i++ )); do
        line="${line}${char}"
    done
    printf "%s\n" "$line"
}

# Box function check
[[ ! $1 ]] && exit 0

declare -i len="${#1} + 4"
drawline len
printf "| %s |\n" "$1"
drawline len