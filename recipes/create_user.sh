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

function create_user() {
  if getent passwd "$1" &>/dev/null; then
    echo "The user $1 already exists on this system"
    exit 2
  fi
  sudo useradd "$1"
  getent passwd "$1" &>/dev/null && echo "User created successfully." || echo "Failed to create user."
}

function set_password() {
  while ! [ -n "$USER_PASSWORD" ]
  do
    read -s -p "Enter a new password for the user $1: " USER_PASSWORD
    echo
  done
  DISTRIB=$(awk -F= '/^ID_LIKE/{print $2}' /etc/os-release)
  if [ "$DISTRIB" = "fedora" ]; then
    echo "$USER_PASSWORD" | sudo passwd "$1" --stdin
  else
    echo "$1:$USER_PASSWORD" | sudo chpasswd
  fi
  unset USER_PASSWORD
}

if [ "$#" -lt 1 ]; then
  usage
fi

for u in "$@"
do
  create_user "$u"
  set_password "$u"
done

