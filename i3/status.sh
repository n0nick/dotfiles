#!/bin/bash

# shell scipt to prepend i3status with more stuff

i3status --config ~/.config/i3status/config | while :
do
    read line
    HOSTNAME=$(hostname -s)
    LG=$(setxkbmap -query | awk '/layout/{print $2}') 

    if [ $LG == "il" ]
    then
        lang="{ \"full_text\": \"$LG\" }"
    else
        lang="{ \"full_text\": \"$LG\" }"
    fi
    # dat="[{ \"full_text\": \"$HOSTNAME\" },$lang"
    dat="[{ \"full_text\": \"$HOSTNAME\" },$lang,"

    echo "${line/[/$dat}" || exit 1
done
