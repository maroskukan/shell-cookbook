#!/usr/bin/env bash

# Installs lint tool for shell scripts
# Tested on Ubuntu 20.04 LTS and CentOS 7.8
# Author: Maros Kukan

if [[ ! -z "$(which yum)" ]]; then
    yum install -y epel-release
    yum install -y ShellCheck
elif [[ ! -z "$(which apt)" ]]; then
    apt update
    apt install -y shellcheck
else
    echo "Error can't install package $PACKAGE"
    exit 1;
fi

