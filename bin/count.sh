#!/usr/bin/env bash

# Description: This script prints a range of numbers
# Author: Maros Kukan

# Usage: count [-r] [-b n] [-s n] stop
# -b gives the number to begin with (default: 0)
# -r reverses the count
# -s sets step size (default: 1)
# counting will stop at stop.

declare reverse=""
declare -i begin=0
declare -i step=1

# Takes b and s with option and r without option
# Non Silent mode "b:s:r"

while getopts ":b:s:r" opt; do 
    case $opt in
        r)
            reverse="yes"
            ;;
        b)
            [[ ${OPTARG} =~ ^[0-9]+$ ]] || { echo "${OPTARG} is not a number" >&2; exit 1; }
            start="${OPTARG}"
            ;;
        s)
            [[ ${OPTARG} =~ ^[0-9]+$ ]] || { echo "${OPTARG} is not a number" >&2; exit 1; }
            step="${OPTARG}"
            ;;
        :)
            echo "Option -${OPTARG} is missing an argument"
            exit 1
            ;;
        \?)
            echo "Unknown option: -${OPTARG}" >&2
            exit 1
            ;;
    esac
done

# Shifting all arguments except of last one
shift $(( OPTIND -1 )) 

[[ $1 ]] || { echo "Missing an argument" >&2; exit 1; }
declare end="$1"

if [[ ! reverse ]]; then
    for (( i=start; i <= end; i+=step )); do
        echo $i
    done
else
    for (( i=end; i >= start; i-=step )); do
        echo $i
    done
fi

exit 0

