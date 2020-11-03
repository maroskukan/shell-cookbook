#!/usr/bin/env bash

# Description: This script prints a range of numbers
# Author: Maros Kukan

# Usage definition
usage () {
    cat <<END
count [-r] [-b n] [-s n] stop

Print each number up to stop, beginning at 0
      -b: number up to begin with (default: 0)
      -h: show this help message
      -r: reverses the count
      -s: sets step size (default: 1)
END
}

# Generic Error Handling
error () {
    echo "Error: $1"
    usage
    exit $2
} >&2

# Verifies if argument is a number
isnum () {
    declare -r num_re='^[0-9]+$'
    declare -r octal_re='^0(.+)'
    num_error="ok"
    if [[ $1 =~ $num_re ]]; then
        if [[ $1 =~ $octal_re ]]; then
            num_error="$1 is not a number, did you mean ${BASH_REMATCH[1]}?"
            return 1
        fi
    else
        num_error="$1 is not a number"
        return 1
    fi

    return 0
}

declare reverse=""
declare -i begin=0
declare -i step=1

# Takes b and s with option and r without option
# Non Silent mode "b:s:r"

while getopts ":hb:s:r" opt; do 
    case $opt in
        r)
            reverse="yes"
            ;;
        b)
            isnum ${OPTARG} || error "${num_error}" 1
            start="${OPTARG}"
            ;;
        h)
            usage
            exit 0
            ;;
        s)
            isnum ${OPTARG} =~ ^[0-9]+$ || error "${OPTARG} is not a number" 1
            step="${OPTARG}"
            ;;
        :)
            error "Option -${OPTARG} is missing an argument"
            exit 1
            ;;
        \?)
            error "Unknown option: -${OPTARG}" 3
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

