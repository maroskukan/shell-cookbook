#!/usr/bin/env bash

# Demostrates usage of string tresing with regular expressions
# Author: Maros Kukan

declare -l user_name
read user_name # Enter Bob

# Example below using == works in Bash 5.0.17+ but not with Zsh 5.8 which uses =
[ $user_name == 'bob' ] && echo "user is bob"

# Example below works in Bash 5.0.17+ and with Zsh 5.8 
[[ $user_name == 'bob' ]] && echo "user is bob"

declare -l browser
read browser # Enter Firefox
[[ $user_name == *fox ]] && echo "The browser is Firefox"

# Example below matching using regular expression
declare -l test_var
read test_var # Enter color
[[ $test_var =~ colou?r ]] && echo "Its a match"

unset user_name
declare -l user_name
read user_name # Enter bob_admin
[[ $user_name =! _admin$ ]] && echo "User is admin"