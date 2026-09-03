#!/bin/bash
# @raycast.schemaVersion 1
# @raycast.title Nudge Right
# @raycast.mode silent
# @raycast.icon ➡️

exec "$(dirname "$0")/nudge-window.sh" right "$1"
