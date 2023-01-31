#!/usr/bin/env bash

# Description: Sample create directory scripts
# Author: Maros Kukan

declare -l DIR
echo -n "Please enter a directory to create: "
read DIR

if [[ -e $DIR ]];then
   echo "$DIR already exists"
   exit 1
else
   if [[ -w $PWD ]];then
      mkdir $DIR
   else
      echo "You don't have permissions to $PWD"
      exit 2
   fi
fi