#!/usr/bin/env bash

DOT="."

for VAR in {1..5}
do
    printf "${DOT}\r"
    DOT="${DOT}."
    sleep 1
done
