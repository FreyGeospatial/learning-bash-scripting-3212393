#!/usr/bin/env bash
var1="im variable 1"

my_func() {
  var2="im variale 2"
  local var3="im variable 3"
}

my_func

echo $var1
echo $var2
echo $var3 # wont return anything