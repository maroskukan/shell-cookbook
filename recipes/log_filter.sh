#!/usr/bin/env bash

# Description: Simple log filter
# Author: Maros Kukan

function usage() {
    cat <<EOM

    Usage:
    $0 <filter> <file>

    <filter>  Filter string
    <file>  File to parse

    Example:
    $0 sudo /var/log/secure
EOM
exit 0
}


if [ "$#" -ne 2 ]; then
    usage
else
    awk "/$1/ { print \$5,\$6,\$14 }" "$2"
fi