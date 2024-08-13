#!/usr/bin/env bash
echo "what is your name?"
read name

echo "what is your password?"
read -s pass # s for sensitive

read -p "what is your favorite animal? " animal # p allows for input to be on same line

echo name: $name password: $pass animal: $animal 

select pet in "bird" "dog" "fish"
do
  echo "you selected $pet"
  break
done

# TO set default INPUT:
read -ep "favorite color? " -i "Blue" favcolor # sets default
echo $favcolor

if (($#<3)); then
  echo "the prgm requires 3 args"
fi

read -p "favorite movie? [Easy Rider]" movie
if [[ -z $movie ]]; then
  movie="Easy Rider"
fi

echo "favorite movie is $movie"