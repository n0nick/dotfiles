#!/usr/bin/env bash

LANG=$(setxkbmap -query | awk '/layout/{print $2}')

if [ "$LANG" == "us" ]; then
  setxkbmap il
else
  setxkbmap us
fi
