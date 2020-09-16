#!/usr/bin/env bash

# Demostrates usage of simple tests conditions
# Author: Maros Kukan

# Variable days will be set to 30 making condition false.
declare -i days=30
if [ $days -lt 1 ]; then echo "Enter correct value"; fi

# Variable days will be set to 0 making condition true.
declare -i days=Monday
if [ $days -lt 1 ]; then echo "Enter correct value"; fi

# Variable days will be set to 31 making the condition true.
declare i days=31
if [ $days -lt 1  ] || [ $days -gt 30 ]; then echo "Enter correct value"; fi

# Same as above, but using arithemtic evaluation
declare -i days=31
if (( days < 1 || days > 30)); then echo "Enter correct vlue"; fi

# Multiple coditions
declare -i days=30
if (( days < 1 || days > 30)); then 
    echo "Enter correct vlue"; 
else
    echo "All good";
fi

# If, Elif, Else
declare -i days
read days

if (( days < 1 )); then echo "Enter numneric value";
elif (( days > 30)); then echo "Too high";
else echo "The value is $days"; fi

# Determining the program exit code
cat /etc/hosts
echo $? # 0 - Succeed

cat /etc/hostss
echo $? # 1 - Failed

# Create user if it does not exist
getent passwd ansible || sudo useradd ansible

# Set password for user only if it exists
getent passwd ansible && sudo passwd ansible

# Cleanup the user
getent passwod ansible && sudo userdel ansible
