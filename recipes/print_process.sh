#!/usr/bin/env bash

# Description: Without shebang at the top, the command will be executed using current shell in new process
# Author: Maros Kukan


ps -f -p "$$"
