#!/usr/bin/env bash
echo "The $0 script has the first argument: $1"

for i in "$@"
do
echo $i
done