#!/usr/bin/env bash

# Description: Simple guessing game
# Author: Maros Kukan

declare answer=$(($RANDOM % 100))
declare guess

echo "$answer"

until [[ $guess -eq $answer ]]; do
    read -p "Take a guess: " guess
    if [[ $guess -gt $answer ]]; then
        echo "Too high!"
    elif [[ $guess -lt $answer ]]; then
        echo "Too low!"
    else
        echo "You nailed it!"
    fi
done

exit 0