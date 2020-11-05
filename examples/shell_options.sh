#!/usr/bin/env bash

# Descroption: Demostrates usage of Shell Options (shops)
# Author: Maros Kukan

# Display all shell options
shopt

# Display single shell option
shopt autocd

# Enabling option
shopt -s autocd
/etc

shopt -s cdspell
cd /ect

# Disabling option
shopt -u autocd
shopt -u cdspell

# To permanently change these options adjust your login script

# Restricted shell
rbash # or bash -r
shopt restricted_shell

