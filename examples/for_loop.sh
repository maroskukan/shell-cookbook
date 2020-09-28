#!/usr/bin/env bash

# Demostrates the use of for loop
# Author: Maros Kukan

# C-style Loop
for ((i=0; i<5; i++)); do
    echo "$i"
    sleep 1
done

for ((i=5; i>0; i--)); do echo "$i"; done


# Iterating an Array
declare -a users=("bob" "joe" "sue")

echo "Number of items in array is ${#users[*]}."
for ((i=0; i<${#users[*]}; i++)); do
    echo "Adding user ${users[$i]}."
    #sudo useradd ${users[$i]};
done


# Classic For loop
for f in $(ls); do stat -c "%n %F" $f; done