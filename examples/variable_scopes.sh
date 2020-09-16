#!/usr/bin/env bash

# Demostrates usage of variables, scopes and arrays
# Author: Maros Kukan

#
# Working with set, export, unset and declare
#

# Set local variable for shell and optionally single command launched from it
EDITOR=vim
set | grep EDITOR
EDITOR=vim crontab -e

# Set environment variable for shell and commands launched from it
export EDITOR
env | grep EDITOR
crontab -e

# Unset evironment variable
unset EDITOR

#
# Working with declare
#

# Using declare with print option to display local and environment variables
declare -p <variable1> <variable2> <variableN>

# Using declare with lower or upper option to control the case of set value
declare -l username=Bob
declare -u password=builder

declare -p username password
echo $useranme $password

unset username password

# Using declare with export option to export variable
EDITOR=vim
declare -p EDITOR
declare -x EDITOR
declare -p EDITOR

# Using declare with minus export option to remove export
declare +x EDITOR
unset EDITOR
declare -p EDITOR

# Using declare with readonly option to create constants or RO variables
declare -r name=maros
name=soram

# Using declare with integer option to set data type to integer
declare -i days=30
days=Monday
declare -p days

# 
# Working with Arrays
#

# Using declare with array option to set an index value array
declare -a user_name
user_name[1]=maros ; user_name[2]=kukan
echo ${user_name[1]}

# Display all elements of a array
echo ${user_name[@]}
unset user_name

# Using declare with array option to set an associative array
declare -A user_name
user_name=([first]=maros [last]=kukan)
echo ${user_name[first]}
unset user_name

# Display all elements of a array