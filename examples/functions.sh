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