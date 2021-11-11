#!/usr/bin/env bash

# Description: Checks the service availability for group of hosts
# Author: Maros Kukan

R='\033[0;31m' # Red
G='\033[0;32m' # Green
N='\033[0m' # No Color

declare -A ljumps=(
  [ljump-01]=1.0.0.1
  [ljump-02]=1.0.0.2
  [ljump-03]=1.0.0.3
)
declare -A wjumps=(
  [wjump-01]=2.0.0.1
  [wjump-02]=2.0.0.2
  [wjump-03]=2.0.0.3
)

printf "Linux Jumps"
for host in "${!ljumps[@]}"; do
  nc -zvw 5 ${ljumps[$host]} 22 &> /dev/null && printf "$host ${G}Online${N}\n" || printf "$host ${R}Offline${N}\n"
done

printf "Windows Jumps"
for host in "${!wjumps[@]}"; do
  nc -zvw 3 ${wjumps[$host]} 3389 &> /dev/null && printf "$host ${G}Online${N}\n" || printf "$host ${R}Offline${N}\n"
done