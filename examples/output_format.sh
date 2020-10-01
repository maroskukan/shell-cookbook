#!/usr/bin/env bash

# Demostrates usage of printf
# Author: Maros Kukan

# Generic printf with single argument
printf "Hello %s, how are you?\n" "$USER"

# Multiple agruments, prints 6 lines
printf "Line %s\n" 1 2 3 4 5 6

# Multiple arguments, prints single line
printf "%s home folder is in %s\n" "$USER" "$HOME"

# Output formatting with column width
printf "|%20s | %20s |%20s |\n" $(ls)

# Redirecting output to variable
printf -v greeting "Hello %s, how are you?\n" "$USER"
echo "$greeting"