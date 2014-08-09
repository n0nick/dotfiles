#!/bin/bash

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner
path="$( cd "$( dirname "$0" )" && pwd )"

$cli export > $path/settings.sh

echo "" >> $path/settings.sh
echo "mkdir -p ~/Library/Application\ Support/Karabiner" >> $path/settings.sh
echo "cp $path/private.xml ~/Library/Application\ Support/Karabiner/" >> $path/settings.sh

echo "echo 'Done.'" >> $path/settings.sh
echo "echo 'Remember to set \"Caps Lock (⇪)\" to be \"No Action\" in Keyboard.prefPane, and then map it to code 80 in PCKeyboardHack.'" >> $path/settings.sh

