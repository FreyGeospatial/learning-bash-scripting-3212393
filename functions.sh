#!/usr/bin/env bash
greet() {
  echo "hello there!"
}

greet() {
  echo "hello there, $1!"
}


greet

echo;echo;

greet "Jordan"

# takes arbitrary number of args
numberthings() {
  i=1
  for f in "$@"; do
    echo $i: "$f"
    ((i++))
  done
}

numberthings *
echo;


numberthings pine birth maple spruce