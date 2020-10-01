#!/usr/bin/env bash

# Demostrates the use of case to check current season
# Author: Maros Kukan

declare -l month=$(date +%b)

case $month in
  dec | jan | feb )
    echo "Winter";;

  mar | apr | may )
    echo "Spring";;

  jun | jul | aug )
    echo "Summer";;

  sep | oct | now )
    echo "Autumn";;
esac
