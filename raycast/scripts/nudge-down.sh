#!/bin/bash
# @raycast.schemaVersion 1
# @raycast.title Nudge Down
# @raycast.mode silent
# @raycast.icon ⬇️

exec "$(dirname "$0")/nudge-window.sh" down "$1"
