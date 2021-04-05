#!/usr/bin/env bash

# Description: Demostrates use of process Substition
# Author: Maros Kukan

# Start by creating two lists
cat <<EOF > list1
jane
bob
EOF

cat <<EOF > list2
bob
jack
EOF

# Compare sorted output or unique entries in two files
comm -3 <(sort list1 | uniq ) <(sort list2 | uniq)

