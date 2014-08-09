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
export SMILEY="☺"

main() {
  echo "${CYAN}Let's go let's go let's go!$RESET"
  install_prezto $*
  install_dotfiles $*
  install_vim $*
  install_karabiner $*
  install_hydra $*
  echo -n "\n\n"
  echo "${GREEN}Yay! That's all! $SMILEY$RESET"
}

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

symlink_dir() {
  dirname=$1
  if [ -L "$HOME/.$dirname" ]; then
    rm "$HOME/.$dirname"
  fi
  symlink "$DOTF/$dirname" "$HOME/.$dirname"
}

chapter() {
  echo
  echo "${BLUE}$ARROW $1$RESET"
}

greendot() {
  echo -n "${GREEN}.$RESET"
}

#### Steps
install_prezto() {
  chapter "Installing and configuring Prezto"
  echo "(TODO)"
}

install_dotfiles() {
  dirs=('ctags' 'git' 'ruby' 'shell' 'tmux')
  for dir in $dirs; do
    chapter "Linking ${(C)dir} configuration files"
    for file ($dir/*); do
      symlink "$DOTF/$file" "$HOME/.${file:t}"
      greendot
    done
  done
}

install_vim() {
  chapter "Installing Vim plugins and configuration"
  symlink_dir "vim"
  greendot
  # Install Vundle.vim if not found
  if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/gmarik/Vundle.vim.git \
      $HOME/.vim/bundle/Vundle.vim
    greendot
  fi
  # Install Vim plugins (via Vundle.vim)
  run "vim +PluginInstall +qall"
  greendot
}

install_karabiner() {
  chapter "Configuring Karabiner"
  run "source" "$DOTF/karabiner/settings.sh"
}

install_hydra() {
  chapter "Configuring Hydra"
  symlink_dir "hydra"
  greendot
}

main $*
