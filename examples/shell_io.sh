#!/usr/bin/env bash

# Description: Demostrates the use of redirection (STDOUT, STDERR) and Exec
# Author: Maros Kukan

# By default STDOUT and STDERR is printed to screen
ls /etc/hosts /etc/host

# Redirecting STDOUT to file
ls /etc/hosts /etc/host > out

# Redirecting STDERR to file
ls /etc/hosts /etc/host 2> errout

# Redirecting STDOUT and STDERR
ls /etc/hosts /etc/host &> allout

# Grouping commands together
( ls /etc/hosts ; ls /etc/host ) > out1; cat out1

# Redirecting STDOUT from shell (overwrites with last STDOUT)
bash > shell.out


# List file distriptors for current process 
ls /proc/$$/fd

# Creating new file descriptor and redirecting STDOUT
LOG=log.file
exec 4>&1
exec > "$LOG"
exec 1>&4 4>&-
