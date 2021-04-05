#!/usr/bin/env bash

# Descroption: Demostrates usage of Shell Options (shops)
# Author: Maros Kukan

# Display all shell options using shopt
shopt

# Display single shell option using shopt
shopt autocd

# Enabling option using shopt
shopt -s autocd
/etc

shopt -s cdspell
cd /ect

# Disabling option using shopt
shopt -u autocd
shopt -u cdspell

# To permanently change these options adjust your login script

# Restricted shell
rbash # or bash -r
shopt restricted_shell

# Displaying shell options using set
set -o
set +o

# Changing shell options using set
ls /etc > file1
ls /etc > file1
# This option enables overwrite protection
set -o noclobber
ls /etc > file1

# To overrule this option
ls /etc >| file1


