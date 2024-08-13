#!/usr/bin/env bash
for i in 1 2 3
do
  echo "loop $i"
done

echo;echo;
declare -A my_arr
my_arr["name"]="FreyGeospatial"
my_arr["id"]=123

for i in "${!my_arr[@]}" # exclamation mark accesses the keys in the array
do
  echo "${my_arr[$i]}"
done