#!/usr/bin/env bash

host=$1
port_first=$2
port_last=$3

for ((port=$port_first; port<=$port_last; port++))
do
  (echo >/dev/tcp/$host/$port) >/dev/null 2>&1 && echo "$port open"
done