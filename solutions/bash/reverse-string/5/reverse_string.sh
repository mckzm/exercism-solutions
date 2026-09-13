#!/usr/bin/env bash

str="$1"
rev=''

for ((i = ${#str}; i >= 0; --i)); do
    rev=$rev${str:i:1}
done

echo "$rev"
