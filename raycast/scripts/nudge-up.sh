#!/bin/bash
# @raycast.schemaVersion 1
# @raycast.title Nudge Up
# @raycast.mode silent
# @raycast.icon ⬆️

exec "$(dirname "$0")/nudge-window.sh" up "$1"
