#!/usr/bin/env bash

# Iterates over array of hosts and prints HTTP response
# Author: Maros Kukan

declare -a arr=("ec2-18-212-88-38.compute-1.amazonaws.com"
                "ec2-52-201-245-57.compute-1.amazonaws.com"
                "ec2-3-94-192-82.compute-1.amazonaws.com"
                "ec2-34-224-167-203.compute-1.amazonaws.com"
                "ec2-3-90-26-43.compute-1.amazonaws.com"
                "ec2-52-23-169-244.compute-1.amazonaws.com")

for host in "${arr[@]}"
do
   echo "Checking $host"
   curl -I -s http://"$host":8080 | grep HTTP
   echo
done

