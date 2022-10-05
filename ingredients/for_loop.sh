#!/usr/bin/env bash

# Description: Demostrates the use of for loop
# Author: Maros Kukan


# Classic Loop (this behaves differently in Bash vs Zsh)
declare sentence="just a list of words"
for word in $sentence; do
    echo "$word";
done


# Classic For loop - one liner
for f in $(ls); do stat -c "%n %F" "$f"; done


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
    echo "Creating user ${users[$i]}."
    sudo useradd "${users[$i]}"
    echo ChangeMe | sudo passwd --stdin "${users[$i]}" &>/dev/null
    tail -n1 /etc/passwd
done

for ((i=0; i<${#users[*]}; i++)); do
    echo "Removing user ${users[$i]}."
    sudo userdel -r "${users[$i]}"
done
