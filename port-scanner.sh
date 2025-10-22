#!/bin/bash

for (( port=1024; port <= 49151; port++)); do
  nc -z -v -w 1 localhost $port  
done
