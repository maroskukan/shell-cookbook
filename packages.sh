#!/usr/bin/env bash

# Description: Installs lint tool for shell scripts
# Validation: Tested on Ubuntu 20.04 LTS and CentOS 7.8
# Author: Maros Kukan

if [[ ! -z "$(which yum)" ]]; then
    yum install -y epel-release
    yum install -y ShellCheck
    exit code 0
elif [[ ! -z "$(which apt)" ]]; then
    apt update
    apt install -y shellcheck
    exit code 0
else
    echo "Error can't install package shellcheck"
    exit 1;
fi

