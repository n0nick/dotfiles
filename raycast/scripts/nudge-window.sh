#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Nudge Window
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ↔️
# @raycast.packageName Window Nudge
# @raycast.argument1 { "type": "dropdown", "placeholder": "Direction", "data": [{"title": "Left", "value": "left"}, {"title": "Right", "value": "right"}, {"title": "Up", "value": "up"}, {"title": "Down", "value": "down"}] }
# @raycast.argument2 { "type": "text", "placeholder": "px (default 40)", "optional": true }

dist="${2:-40}"

case "$1" in
  left)  dx=-$dist; dy=0 ;;
  right) dx=$dist;  dy=0 ;;
  up)    dx=0; dy=-$dist ;;
  down)  dx=0; dy=$dist  ;;
  *) echo "bad direction"; exit 1 ;;
esac

osascript - "$dx" "$dy" <<'EOF'
on run argv
  set dx to (item 1 of argv) as integer
  set dy to (item 2 of argv) as integer
  tell application "System Events"
    set p to first application process whose frontmost is true
    set w to first window of p
    set {x, y} to position of w
    set position of w to {x + dx, y + dy}
  end tell
end run
EOF
