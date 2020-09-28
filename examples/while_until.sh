#!/usr/bin/env bash

# Demostrates the use of while until loop
# Author: Maros Kukan

# Echoes numbers 10 through 1
declare -i x=10
while (( x > 0 )); do
  echo "$x"
  sleep 1
  x=x-1
done
echo "Variable x is set to $x after until loop"

declare -i x=10
until (( x == 0 )); do
  echo "$x"
  sleep 1
  x=x-1
done
echo "Variable x is set to $x after until loop"