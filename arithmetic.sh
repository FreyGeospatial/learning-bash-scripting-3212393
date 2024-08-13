#!/usr/bin/env bash

a=3
((a+=3))
echo "the value of 'a' is ${a}"
((a++))
echo "the value of 'a' is now ${a} after running ((a++))"

echo;echo;

# see this, however:
b=3
((b+=3))
echo "the value of 'b' is ${b}"
echo "the value of 'b' is $((b++)) when running increment within echo"
echo "the value of 'b' actually changed to ${b} after the echo sent output to the terminal."