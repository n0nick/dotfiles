#!/bin/sh

cli=/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli

$cli set remap.uk_section2backquote 1
/bin/echo -n .
$cli set repeat.wait 23
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
$cli set parameter.keyoverlaidmodifier_timeout 300
/bin/echo -n .
$cli set f19_to_hyper_and_escape 1
/bin/echo -n .
/bin/echo
mkdir -p ~/Library/Application\ Support/KeyRemap4MacBook
cp ./private.xml ~/Library/Application\ Support/KeyRemap4MacBook/
echo 'Remember to set "Caps Lock (⇪)" to be "No Action" in Keyboard.prefPane, and then map it to code 80 in PCKeyboardHack.'
