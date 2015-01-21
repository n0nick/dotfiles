#!/bin/zsh

export DOTF="$( cd "$( dirname "$0" )" && pwd )"

export GREEN="\033[32m"
export YELLOW="\033[33m"
export BLUE="\033[34m"
export PURPLE="\033[35m"
export RESET="\033[0m"

if [ "`uname -s`" = "Darwin" ]; then
  export OS=mac
else
  export OS=linux
fi

main() {
  echo "${PURPLE}Let's do this!$RESET"
  install_prezto $*
  install_dotfiles $*
  install_vim $*

  if [ "$OS" == "mac" ]; then
    install_karabiner $*
    install_slate $*
  fi

  install_git_userconfig $*
  echo -n "\n\n"
  echo "${GREEN}Yay! That's all!  ¯\_(ツ)_/¯$RESET"
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
  echo "\n${BLUE}⇒ $1$RESET"
}

notice() {
  echo "\n${YELLOW}• $*"
}

greendot() {
  echo -n "${GREEN}.$RESET"
}

#### Steps
install_prezto() {
  chapter "Installing and configuring Prezto"
  preztodir="$HOME/.zprezto"
  if [ ! -d "$preztodir" ]; then
    # Clone Prezto if not found
    run "git clone --recursive --quiet" \
      "https://github.com/n0nick/prezto.git" \
      "$preztodir"
    greendot
    # Set up symlinks
    setopt EXTENDED_GLOB
    for rcfile in "$preztodir"/runcoms/^README.md(.N); do
      symlink "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
      greendot
    done
  else
    # Update Prezto
    run "git -C \"$preztodir\" pull --quiet"
    greendot
    run "git -C \"$preztodir\" submodule update --init --recursive --quiet"
    greendot
  fi
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
    run "git clone --quiet" \
      "https://github.com/gmarik/Vundle.vim.git" \
      "$HOME/.vim/bundle/Vundle.vim"
    greendot
  fi
  # Install Vim plugins (via Vundle.vim)
  run "vim +PluginInstall +qall"
  greendot
}

install_karabiner() {
  chapter "Configuring Karabiner"
  run "source" "$DOTF/karabiner/settings.sh" >& /dev/null
  greendot
  support="$HOME/Library/Application\ Support/Karabiner"
  run "mkdir" "-p" "$support"
  symlink "$DOTF/karabiner/private.xml" "$support/"
  greendot
  notice "Remember to set \"Caps Lock (⇪)\" to be \"No Action\" in" \
    "Keyboard.prefPane, and then map it to code 80 in Seil.$RESET"
}

install_slate() {
  chapter "Configuring Slate"
  run "git -C \"$DOTF\" submodule update --recursive --quiet"
  greendot
  symlink "$DOTF/slate/reslate/reslate.js" "$HOME/.reslate.js"
  greendot
  symlink "$DOTF/slate/slate.js" "$HOME/.slate.js"
  greendot
}

install_git_userconfig() {
  chapter "Configuring Git user details"
  filename="$HOME/.gitconfig.user"
  if [ ! -r "$filename" ]; then
    name=$(finger `whoami` | awk -F: '{ print $3 }' | head -n1 | sed 's/^ //')
    vared -p "Name to use for Git commits? " name
    email="`whoami`@"
    vared -p "Email to use for Git commits? " email
    github=`whoami`
    vared -p "Github username? " github

    touch $filename
    echo "[user]" >> $filename
    echo -e "\tname = $name" >> $filename
    echo -e "\temail = $email" >> $filename
    echo "[github]" >> $filename
    echo -e "\tuser = $github" >> $filename
    greendot
  else
    echo "${GREEN}gitconfig.user already exists :)"
  fi
}

main $*
