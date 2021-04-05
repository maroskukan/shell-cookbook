#!/usr/bin/env bash

# Description: Demostrates usage of parameter expansion default values
# Author: Maros Kukan


#declare notesdir="${HOME}"
#[[ $NOTESDIR ]] && notesdir="${NOTESDIR}"

# Above two lines can be replaced with following syntax
declare notesdir=${NOTESDIR:-$HOME}


