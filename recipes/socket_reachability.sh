#!/usr/bin/env bash


HOST=$1
PORT=$2

(echo >/dev/tcp/${HOST}/${PORT}) &>/dev/null
if [ $? -eq 0 ]; then
    echo "Connection successful"
else
    echo "Connection unsuccessful"
fi