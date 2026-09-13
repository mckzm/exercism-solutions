#!/usr/bin/env bash

str="$1"
rev=''
    
for ((i = 0; i < ${#str}; i++)); do
    c="${str:i:1}"
    rev=$c$rev
done

echo "$rev"
