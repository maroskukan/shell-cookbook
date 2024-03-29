#!/usr/bin/env bash

# Description: Demostrates usage of variables, scopes and arrays
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

# Multiple words in single varilable
files="file1 file2"
zsh -c "touch ${files}"
bash -c "touch ${files}"


#
# Working with declare
#

# Using declare with print option to display local and environment variables
declare -p <variable1> <variable2> <variableN>

# Using declare with lower or upper option to control the case of set value
declare -l username=Bob
declare -u password=builder

declare -p username password
echo ${useranme} ${password}

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

declare p="4+5"
echo ${p} # will print 4+5
declare -i p
echo ${p} # will print 9

# Arithmetic expressions - C-like syntax
let n=100/2
((++n))
((--n))
((p=n / 5))
(( p= $(ls | wc -l) * 10))

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

# Iterating over associative array and print all key/value pairs - not working with zsh
declare -A user_name
user_name=([first]=maros [last]=kukan)
for key in "${!user_name[@]}"
do
    # Print the key Value
    echo "Key $key is associated with value of ${user_name[$key]}"
done
unset user_name

# To retrieve lenght of string in variable
declare var=Hello
declare var_len=${#var}
echo "${var_len}"

# Special variables
# $0 contains name of the script when it was called
# $1-$9 ${10}...  contain positional parameters
# $@ contains all script arguments, but when double quoted "$1" "$2" "$3" ... "$N", parameters contain multiple words stay intact, preferred way
# $* contains all script arguments, but when double quoted: "$1 $2 $3 ... $N", parameters are joined togetner
# $# contains number of script arguments
# $? contains exit status for last command
# $$ contains the current process id of running app
# $_ contains the last argument

ls /
echo $?

# $_ contains previous argument
ls /
ls -al $_

# !! refers to last command
cat /etc/sudoers.d
sudo !!