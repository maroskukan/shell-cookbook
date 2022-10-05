#!/usr/bin/env bash

# Description: Checks if user exists, if no creates it
# Author: Maros Kukan


declare -a users=("bob" "joe" "sue")


for ((i=0; i<${#users[*]}; i++)); do
  if getent passwd "${users[$i]}" &>/dev/null;
  then
      echo "User "${users[$i]}" already exist. Skipping..."
  else	  
    echo "Creating user ${users[$i]}."
    sudo useradd "${users[$i]}"
    echo ChangeMe | sudo passwd --stdin "${users[$i]}" &>/dev/null
    tail -n1 /etc/passwd
  fi
done

