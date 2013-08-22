#!/bin/bash

cli=/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli

$cli export > settings.sh

echo "mkdir -p ~/Library/Application\ Support/KeyRemap4MacBook" >> settings.sh
echo "cp ./private.xml ~/Library/Application\ Support/KeyRemap4MacBook/" >> settings.sh

echo "echo 'Remember to set \"Caps Lock (⇪)\" to be \"No Action\" in Keyboard.prefPane, and then map it to code 80 in PCKeyboardHack.'" >> settings.sh

