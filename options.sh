#!/usr/bin/env bash
while getopts u:p:ab option; do
  case $option in
    u) user=$OPTARG;;
    p) pass=$OPTARG;;
    a) echo "arbitrary flag doing something";;
    b) echo "something else";;
  esac
done

echo "user: $user"
echo "password: $pass"