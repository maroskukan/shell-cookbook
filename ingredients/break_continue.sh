#!/usr/bin/env bash

# Description: Demostrates usage of break and continue
# Author: Maros Kukan

# List files not Directories
# continue skips the rest of current iteration and continues with next iteration
for file in $(ls); do
    if [[ -d $file ]]; then
        continue
    fi
    echo $file
done 

# In case of break when test condition evaluates to true the loop is exited
for file in $(ls); do 
    if [[ $file == 'README.md' ]]; then
        echo "README.md Exists"
        break
    fi
    echo "$file No match"
done