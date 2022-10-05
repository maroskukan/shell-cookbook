#!/usr/bin/env bash 

# Description: Prints process by id
# Author: Maros Kukan


echo "The program $0 have been executed with $# arguments"
echo "The program $(basename $0) have been executed with $# arguments"

PID=${*:-"1"}
ps -fp "$PID" | grep -v PID
