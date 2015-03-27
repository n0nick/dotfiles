#!/bin/zsh

export DOTF="$( cd "$( dirname "$0" )" && pwd )"

export GREEN="\033[32m"
export YELLOW="\033[33m"
export BLUE="\033[34m"
export PURPLE="\033[35m"
export RESET="\033[0m"

main() {
  echo "${PURPLE}Let's do this!$RESET"
  install_prezto $*
  install_dotfiles $*
  install_vim $*

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
  # Install Vim plugins (via vim-plug)
  curl -fLo "$DOTF/vim/autoload/plug.vim" --create-dirs \
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  greendot
  run "vim +PlugInstall +qall"
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
