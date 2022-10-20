#!/usr/bin/env bash

# Create a report file for a single shipping container
# Author: Maros Kukan

# Creating function without argument
function say_hello {
    echo "Hello"
}

# Calling simple function
say_hello

# To list all existing functions (summary)
declare -F say_hello

# To list all existing functions (detault)
declare -f say_hello

# Exporting function so it can be used in child process
declare -xf say_hello

# Creating function with argument(s)
sum () {
    return $(( $1 + $2 ))
}

# Calling function with argument
sum 4 5

# Displaying return of previous function
echo $?

# Returns 0 only when provided arguments starts with "a" or "A")
starts_with_a() {
    [[ $1 == [aA]* ]];
    return $?
}

# Using function inside a condition
if starts_with_a Aeroplane; then
    echo "Yes"
else
    echo "No"
fi

function create_user () {
    if ( getent passwd $1 > /dev/null ); then
        echo "$1 already exists";
        return 1;
    else
        sudo useradd $1;
        echo "User $1 created";
        return 0;
    fi
}

# Calling function with argument(s)
create_user ansible

# Scoping function variables
function print_age () {
    local age=$1
    echo "Your age is $age"
}

# Separator function
function separate () {
    # Add default value when no argument is provided
    declare line
    if [[ $1 ]]; then
        local char="$1"
    else
        local char="*"
    fi
    for (( i=0; i<$COLUMNS; i++ )); do
        line="${line}${char}"
    done
    printf "$line\n"
}

# Simple function to clean file from empty lines and commends
function clean_line () {
    sed -i '/^#/d;/^$/d' $1
}
