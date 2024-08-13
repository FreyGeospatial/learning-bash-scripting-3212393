#!/usr/bin/env bash
a=1
if [[ ${a} -gt 1 ]]
  then
  echo "${a} is greater than 1"
elif [[ ${a} == 1 ]]
  then
  echo "${a} is equal to 1"
else
  echo "${a} is NOT greater than 1"
fi