#!/bin/sh -e

# Take a screenshot
scrot /tmp/screen_locked.png

# Pixellate it a bit
mogrify -scale 5% -scale 2000% /tmp/screen_locked.png

# Lock screen displaying this image.
i3lock -i /tmp/screen_locked.png -n
