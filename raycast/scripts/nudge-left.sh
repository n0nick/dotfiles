#!/bin/bash
# @raycast.schemaVersion 1
# @raycast.title Nudge Left
# @raycast.mode silent
# @raycast.icon ⬅️

exec "$(dirname "$0")/nudge-window.sh" left "$1"