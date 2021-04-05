#!/usr/bin/env bash

# Description: Demostrates arithmetic operations
# Author: Maros Kukan

declare -ir target=$(( ($RANDOM % 100) + 1 ))

declare -i guess=0

until (( guess == target )); do
    read -p "Take a guess: " guess

    (( guess )) || continue

    if (( guess < target )); then
        echo "Higher!"
    elif (( guess > target )); then
        echo "Lower!"
    else
        echo "You found it!"
    fi
done

exit 0