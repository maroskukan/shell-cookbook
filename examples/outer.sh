#!/usr/bin/env bash

# Description: Demostrates usage of export
# Author: Maros Kukan

declare -x var="outer"
echo "outer before: $var"
./inner.sh
echo "outer after: $var"

# Changes in child process are not reflected in parent process
cd /
ls -l