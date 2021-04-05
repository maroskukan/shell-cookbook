#!/usr/bin/env bash

# Description: Demostrates usage of arithmetic evaluation
# Author: Maros Kukan

# Populate variables with let builtin
let a=3+5

# Display result directly or save in variable 
expr 3 + 5
a=$(expr 3 + 23)

# Using double parenthesis
echo $(( 3 * 5 ))

daily_rate=3; rate=2
(( rate < daily_rate )) && echo OK

