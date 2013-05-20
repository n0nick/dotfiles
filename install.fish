#!/usr/local/bin/fish

function _link --description="Creates a symbolic link, saving aside a backup if needed"
  set source $argv[1]
  set target $argv[2]

  if eval "test -e $target"
    echo "File $target exists, keeping a copy in $target.bak"
    mv $target{,.bak}
  end

  ln -s $PWD/$source $target
end

### Fish shell stuff
#TODO figure out if i want to:
# 1) use oh-my-fish and just populate its custom/ dir
# 2) fork oh-my-fish
# 3) go commando
# for now i'm going with (1)
echo "=> Installing oh-my-fish customizations"
rm -fr ~/.oh-my-fish/custom.bak
mv ~/.oh-my-fish/custom{,.bak}
ln -s $PWD/fish ~/.oh-my-fish/custom
echo "Done."

### Regular dotfiles to symlink
set stuff ctags git ruby shell
for thing in $stuff
  echo "=> Installing: $thing configuration"
  for file in (ls $thing)
    _link "$thing/$file" "$HOME/.$file"
  end

  echo "Done."
  echo
end
