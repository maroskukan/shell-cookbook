#!/usr/bin/env bash

# Description: Simple interactive script for user creation
# Author: Maros Kukan


function usage() {
  cat <<HELP_USAGE
  Usage:
  $(basename $0) <username>
HELP_USAGE
  exit 1
}


if [ "$#" -lt 1 ]; then 
  usage
elif getent passwd "$1" &>/dev/null; then
  echo "The user $1 already exists on this system"
  exit 2
else
  read -s -p "Enter a new password for the user $1: " USER_PASSWORD
  sudo useradd "$1"
  DISTRIB=$(awk -F= '/^ID_LIKE/{print $2}' /etc/os-release)
  if [ "$DISTRIB" = "fedora" ]; then 
    echo "$USER_PASSWORD" | sudo passwd "$1" --stdin
  else  
    echo "$1:$USER_PASSWORD" | sudo chpasswd
  fi
  getent passwd "$1" &>/dev/null && echo "User created successfully." || echo "Failed to create user."
fi
  

