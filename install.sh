#!/bin/zsh

export DOTF="$( cd "$( dirname "$0" )" && pwd )"

export BLACK="\033[30m"
export GRAY="\033[1;30m"
export RED="\033[31m"
export GREEN="\033[32m"
export YELLOW="\033[33m"
export BLUE="\033[34m"
export CYAN="\033[36m"
export UNDERLINE="\033[4m"
export RESET="\033[0m"

export ARROW="⇒"

run() {
  if [ $DEBUG ]; then
    echo "$ $*"
  else
    eval "$*"
  fi
}

symlink() {
  local source=$1
  local target=$2

  run "ln -sf" $source $target
}

chapter() {
  echo
  echo "${BLUE}$ARROW $1$RESET"
}

greendot() {
  echo -n "${GREEN}.$RESET"
}

# Prezto
chapter "Installing and configuring Prezto"
echo "(TODO)"

# Symlink dotfiles
dirs=('ctags' 'git' 'ruby' 'shell' 'tmux')
for dir in $dirs; do
  chapter "Linking ${(C)dir} configuration files"
  for file ($dir/*); do
    symlink "$DOTF/$file" "$HOME/.${file:t}"
    greendot
  done
  echo " Done."
done

# Vim
chapter "Configuring Vim"
run "git clone https://github.com/n0nick/vimrc.git ~/.vim"
run ~/.vim/install.sh

# Karabiner
chapter "Configuring Karabiner"
run "source" "$DOTF/karabiner/settings.sh"

# Hydra
chapter "Configuring Hydra"
symlink "$DOTF/hydra" "$HOME/.hydra"

# That's all
