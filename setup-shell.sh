##!/usr/bin/env bash

# Dont link DS_Store files
find . -name ".DS_Store" -exec rm {} \; 

PROGRAMS=(bash git)

for program in ${PROGRAMS[@]}; do
  stow -v --target=$HOME $program
  echo "Configuring $program"
done
