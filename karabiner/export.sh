#!/bin/bash

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli export > settings.sh

echo "mkdir -p ~/Library/Application\ Support/Karabiner" >> settings.sh
echo "cp ./private.xml ~/Library/Application\ Support/Karabiner/" >> settings.sh

echo "echo 'Remember to set \"Caps Lock (⇪)\" to be \"No Action\" in Keyboard.prefPane, and then map it to code 80 in PCKeyboardHack.'" >> settings.sh

