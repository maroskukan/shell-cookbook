#!/usr/bin/env bash

# Description: Demostrates usage of export
# Author: Maros Kukan

echo "inner before: $var"
export var="inner"
echo "inner after: $var"