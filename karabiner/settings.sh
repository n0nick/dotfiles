#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set f19_to_hyper_and_escape 1
/bin/echo -n .
/bin/echo

mkdir -p ~/Library/Application\ Support/Karabiner
cp /Users/sagie/dev/personal/dotfiles/karabiner/private.xml ~/Library/Application\ Support/Karabiner/
echo 'Done.'
echo 'Remember to set "Caps Lock (⇪)" to be "No Action" in Keyboard.prefPane, and then map it to code 80 in PCKeyboardHack.'
