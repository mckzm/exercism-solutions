#!/bin/sh
## task 1
awk -F: '{print $1}' ./passwd

## task 2
awk '{print NR}' ./passwd

## task 3
awk -F: '$6 !~ /^\/(home|root)/ {print $0}' ./passwd

## task 4
awk -F: '$6 ~ /^\/(home|root)/ && $NF ~ /\/bash$/ {print $0}' ./passwd
