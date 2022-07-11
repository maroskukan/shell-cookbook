#!/usr/bin/env bash

if [ -f /.dockerenv ]; then
    printf "I'm likely a container";
else
    printf "I'm not likely a container";
fi