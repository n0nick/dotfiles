#!/usr/local/bin/fish

#TODO figure out if i want to:
# 1) use oh-my-fish and just populate its custom/ dir
# 2) fork oh-my-fish
# 3) go commando

# for now i'm going with (1)

rm -fr ~/.oh-my-fish/custom.bak
mv ~/.oh-my-fish/custom{,.bak}
ln -s $PWD ~/.oh-my-fish/custom
