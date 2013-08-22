#!/bin/sh

echo "Installing reslate..."
sh $(pwd)/install-reslate.sh

echo "Linking slate.js config file..."
mv ~/.slate.js ~/.slate.js.bak
ln -s $(pwd)/slate.js ~/.slate.js

echo "Done."
echo "Don't forget to install Slate from https://github.com/jigish/slate ."
