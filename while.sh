#!/usr/bin/env bash
echo "while loop"

declare -i n=0
while [[ ${n} -lt 10 ]]
do
  echo "n${n}"
  ((n++))
done

echo;echo;

echo "another while loop"
# can also do it this way, since only dealing with number comparison:
declare -i n=0
while ((n<10))
do
  echo "n${n}"
  ((n++))
done