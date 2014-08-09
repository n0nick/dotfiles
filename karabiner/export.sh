#!/bin/bash

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner
path="$( cd "$( dirname "$0" )" && pwd )"

$cli export > $path/settings.sh
