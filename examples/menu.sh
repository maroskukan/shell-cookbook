#!/usr/bin/env bash

# Demostrates use of while and case to create menu
# Author: Maros Kukan

function create_dir () {
    declare -l directory
    read -p "Enter a directory name: " directory
    mkdir "$directory"
}

while true; do
    clear
    echo "Choose 1 2 3 or 4"
    echo "1: Display users"
    echo "2: Display disk usage"
    echo "3: Display memory usage"
    echo "4: Create Directory"
    echo "5: quit"
    read -sn1 
    case "$REPLY" in
        1) cut -d: -f1 /etc/passwd;;
        2) df -h;;
        3) free -m;;
        4) create_dir;;
        5) exit 0;;
    esac
    read -n1 -p "Press any key"
done