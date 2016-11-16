#!/bin/bash

# shell scipt to prepend i3status with more stuff

i3status --config ~/.config/i3status/config | while :
do
    read line

    lang="{ \"full_text\": \"$(setxkbmap -query | awk '/layout/{print $2}')\" }"
    hostname="{ \"full_text\": \"$(hostname -s)\" }"

    dat="$hostname,$lang,"

    echo "${line/[/[$dat}" || exit 1
done
