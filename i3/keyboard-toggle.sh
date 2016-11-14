#!/usr/bin/env bash

LANG=$(setxkbmap -query | grep layout | awk '{print $2}')

if [ "$LANG" == "us" ]; then
  setxkbmap il
else
  setxkbmap us
fi
