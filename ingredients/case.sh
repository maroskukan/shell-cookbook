#!/usr/bin/env bash

# Description: Demostrates the use of case 
# Author: Maros Kukan

# General syntax
# case WORD in
#   PATTERN1)
#     code for pattern 1;;
#   PATTERN2)
#     code for pattern 2;;
#   PATTERn)
#     code for pattern n;;
# esac
  

# Which months it is?
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

# Animal script

case $1 in
  cat)
    echo "meow";;
  dog)
    echo "whoof";;
  cow)
    echo "mooo";;
  *)
    echo "Unknow animal"
esac